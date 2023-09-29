import 'package:flutter/material.dart';

void showGameOverPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Game Over"),
        content: Text("You've run out of tries!"),
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
