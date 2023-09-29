import 'package:flutter/material.dart';

void showWinningPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Congratulations!"),
        content: Text("You've won the game!"), // Customize the content
        actions: <Widget>[
          TextButton(
            child: Text("Play Again"),
            onPressed: () {
              // You can reset the game state here.
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
