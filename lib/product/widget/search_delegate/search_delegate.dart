import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';
import 'package:riverpod_architecture/product/widget/search_delegate/base_delegate_model.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';

class CustomSearchDelegate<T extends BaseDelegateModel>
    extends SearchDelegate<T?> {
  final List<T> items;

  CustomSearchDelegate({required this.items});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = items.where(
      (element) =>
          element.text.locale.toLowerCase().contains(query.toLowerCase()) ??
          false,
    );

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: LocaleText(text: results.elementAt(index).text ?? ''),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = items.where(
      (element) =>
          element.text.locale.toLowerCase().contains(query.toLowerCase()) ??
          false,
    );

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {
              close(context, results.elementAt(index));
            },
            title: LocaleText(text: results.elementAt(index).text ?? ''),
          ),
        );
      },
    );
  }
}
