import 'package:flutter/material.dart';

// shows all search results in a listview
Widget addressSearchResults(List responses, TextEditingController textController) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: responses.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          ListTile(
            onTap: () {
              String text = responses[index]['place'];

              textController.text = text;

              // hides keyboard when user taps on a tile
              FocusManager.instance.primaryFocus?.unfocus();
            },
            leading: const CircleAvatar(child: Icon(Icons.location_on)),
            title: Text(responses[index]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(responses[index]['address'],
                overflow: TextOverflow.ellipsis),
          ),
          const Divider(),
        ],
      );
    },
  );
}