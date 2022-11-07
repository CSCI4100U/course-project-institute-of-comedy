import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'ivan',
    'burger',
    'fries',
    'drink',
    'monkey',
    'monkey1',
    'monkey2',
    'monkey3',
    'monkey4',
    'monkey5',
    'ape',
    'pear',
    'apple',
    'orange',
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

  // results of the user's search
  //TODO
  // Build list view of products, picture and product name.
  @override
  Widget buildResults(BuildContext context) {
    List<String> matches = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matches.add(term);
      }
    }

    //after finding matches, build a listview of all matches
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matches[index]),
          onTap: () {
            // when item is tapped, close the search bar and return user choice
            query = matches[index];
            close(context, query);
          },
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
      itemCount: matches.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matches[index]),
          onTap: () {
            // when item is tapped, close the search bar and return user choice
            query = matches[index];
            close(context, query);
          },
        );
      },
    );
  }
}
