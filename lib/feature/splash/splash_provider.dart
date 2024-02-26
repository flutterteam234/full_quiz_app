import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/database/core/hive_database_manager.dart';
import 'package:riverpod_architecture/product/models/appInfo.dart';
import 'package:riverpod_architecture/product/services/device_info/device_info.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';
import '../../product/utility/exceptions/custom_exceptions.dart';

class SplashNotifier extends StateNotifier<SplashState> with FirebaseUtility {
  SplashNotifier() : super(const SplashState());

  Future<void> appInit(BuildContext context) async {


    await DeviceInfo.instance.setup();
    await getAppInfo();
    checkDeviceInfo();
    await EasyLocalization.ensureInitialized();
    await HiveDatabaseManager().start();

    await Future.delayed(const Duration(seconds: 1));
    setIsLoading(false);
  }

  Future<void> getAppInfo() async {
    try {
      CollectionReference collectionReference =
          FirebaseCollections.app.reference;
      final response = await collectionReference.withConverter<AppInfo?>(
        fromFirestore: (snapshot, options) {
          return const AppInfo().fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          return value!.toJson();
        },
      ).get();


    if (response.docs.isNotEmpty) {
        final value = response.docs.map((e) => e.data()).toList();
        final appInfo = value[0];
        state = state.copyWith(
          appInfo: appInfo,
        );
      }
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  void checkDeviceInfo() {
    if (state.appInfo!.version == null) {
      state = state.copyWith(
        isPass: false,
      );
    } else {
      if (state.appInfo!.status == true) {
        if (DeviceInfo.instance.deviceInfo.version == state.appInfo!.version) {
          state = state.copyWith(
            isPass: true,
            status: true,
          );
        } else {
          state = state.copyWith(
            isPass: false,
            status: true,
          );
        }
      } else {
        state = state.copyWith(status: false);
      }
    }
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

class SplashState {
  const SplashState(
      {this.isLoading = true,
      this.appInfo,
      this.isPass = true,
      this.status = true});

  final bool isLoading;
  final AppInfo? appInfo;
  final bool isPass;
  final bool status;

  List<Object?> get props => [isLoading, appInfo, isPass, status];

  SplashState copyWith({
    bool? isLoading,
    AppInfo? appInfo,
    bool? isPass,
    bool? status,
  }) {
    return SplashState(
        isLoading: isLoading ?? this.isLoading,
        appInfo: appInfo ?? this.appInfo,
        isPass: isPass ?? this.isPass,
        status: status ?? this.status);
  }
}
