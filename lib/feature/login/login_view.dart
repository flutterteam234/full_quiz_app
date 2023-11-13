import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/feature/login/login_provider.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final loginProvider =
      StateNotifierProvider<LoginProvider, int>((ref) => LoginProvider());

  @override
  Widget build(BuildContext context) {
    CollectionReference questions =
        FirebaseFirestore.instance.collection('questions');

    final response = questions.withConverter<Questions?>(
      fromFirestore: (snapshot, options) {
        final jsonBody = snapshot.data();
        if (jsonBody != null) {
          return Questions.fromJson(jsonBody)..copyWith(id: snapshot.id);
        }
        return null;
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomExceptions('$value not null');
        return value.toJson();
      },
    ).get();

    final counter = ref.watch(loginProvider);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: response,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Questions?>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Placeholder();
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const LinearProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final value =
                      snapshot.data!.docs.map((e) => e.data()).toList();

                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(value[index]!.question.toString());
                      });
                } else {
                  return const SizedBox();
                }
            }
          }),
    );
  }
}
