import 'package:flutter/material.dart';
import 'package:hangman_game/consts.dart';

Widget hidden_letter(String letter, bool isGuessedCorrectly, List<String> selectedChar) {
  return Container(
    width: 25, // Adjust the width as needed
    height: 30, // Adjust the height as needed
    decoration: BoxDecoration(
      border: Border.all(),
      color: isGuessedCorrectly ? Colors.green : Colors.transparent, // Background color for correct guesses
    ),
    child: Center(
      child: Text(
        isGuessedCorrectly || selectedChar.contains(letter.toLowerCase()) ? letter : " ",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isGuessedCorrectly ? Colors.white : Colors.black, // Text color for correct guesses
        ),
      ),
    ),
  );
}


