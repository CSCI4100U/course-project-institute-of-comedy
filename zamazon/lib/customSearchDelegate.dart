import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';

class CustomSearchDelegate extends SearchDelegate {
  final searchTerms = const [
    'Computer',
    'Electronics',
    'Hardware',
    'Burger',
    'Food',
    'Edible',
    'Clothing',
    'School',
    'Gym',
  ];

  // New actions built on the right of search bar
  @override
  List<Widget>? buildActions(BuildContext context) {
    // x-button for clearing the search bar
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  // Builds thing before the search bar
  @override
  Widget? buildLeading(BuildContext context) {
    // back button to stop searching
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // results of the user's search, shows up after presses button to complete typing, or
  // if user chooses a tag.
  @override
  Widget buildResults(BuildContext context) {
    List<Product> productList = Provider.of<List<Product>>(context);

    List<Product> matches = [];
    for (var product in productList) {
      List lowers =
          product.categories!.map((cat) => cat.toLowerCase()).toList();

      if (lowers.any((cat) => cat.contains(query.toLowerCase()))) {
        matches.add(product);
      }
    }

    //after finding matches, build a listview of all matched products
    return ListView.builder(
      itemCount: (matches.isNotEmpty) ? matches.length : 1,
      itemBuilder: (context, index) {
        return (matches.isNotEmpty)
            ? ListTile(
                title: Image.network(matches[index].imageUrlList![0]),
                subtitle: Text(matches[index].title!),
                onTap: () {
                  // when item is tapped, close the search bar and return user choice
                  query = matches[index].title!;
                  close(context, matches[index]);
                },
              )
            : const ListTile(
                title: Text("No Terms/Products Found"),
              );
      },
    );
  }

  // shows suggestions for user when typing
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matches = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matches.add(term);
      }
    }

    //after finding matches, build a listview of all matches
    return ListView.builder(
      itemCount: (matches.isNotEmpty) ? matches.length : 1,
      itemBuilder: (context, index) {
        return (matches.isNotEmpty)
            ? ListTile(
                title: Text(matches[index]),
                onTap: () {
                  // when item is tapped, close the search bar and return user choice
                  query = matches[index];
                  showResults(context);
                },
              )
            : const ListTile(
                title: Text("No Terms/Products Found"),
              );
      },
    );
  }
}
