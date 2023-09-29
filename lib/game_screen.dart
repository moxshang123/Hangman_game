import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/game/figure_widgget.dart';
import 'package:hangman_game/game/hidden_letter.dart';
import 'package:hangman_game/popup.dart';
import 'consts.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = "Guesstheword".toUpperCase();
  List<String> selectedChar = [];
  var tries = 0;
  List<String> correctGuesses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: const Text("Hangman: the game"),
         elevation: 0.0,
         backgroundColor: Colors.transparent,
       ),
      body: Column(
        children: [
          Expanded(
              flex:3,
              child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      width: 500,
                      height: 500,
                      child: figure(GameUI.body, tries >=0),
                    ),
                    Container(
                      width: 500,
                      height: 500,
                      child: figure(GameUI.hang, tries >=1),
                    ),
                    Container(
                      width: 500,
                      height: 500,
                      child: figure(GameUI.head, tries >=2),
                    ), Container(
                      width: 500,
                      height: 500,
                      child:figure(GameUI.leftarm, tries >=3),
                    ),
                    Container(
                      width: 500,
                      height: 500,
                      child: figure(GameUI.rightarm, tries >=4),
                    ), Container(
                      width: 500,
                      height: 500,
                      child: figure(GameUI.leftleg, tries >=5),
                    ), Container(
                      width: 500,
                      height: 500,
                      child: figure(GameUI.rightleg, tries >=6),
                    )

                  ],
                )),

              Expanded(child: Container(
                 padding: const EdgeInsets.all(8.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: word.split("").map((e) => hidden_letter(e, selectedChar.contains(e.toUpperCase()), selectedChar)).toList(),
                ),


              )),
            ],
          )
          ),
          Expanded(
           flex: 2,
           child: Container(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 7,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              children: characters.split("").map((e) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54,
                    ),
                    onPressed: selectedChar.contains(e.toUpperCase()) ? null :() {
                      setState(() {
                        selectedChar.add(e.toUpperCase());
                        if(word.split("").contains((e.toUpperCase()))){
                         correctGuesses.add(e.toUpperCase());
                        }
                        else{
                          tries++; }
                          if (tries >= 6) {
                            // Game over condition, all tries used up
                            showGameOverPopup(context);
                          }
                        }
                    );
                    },

                    child: Text(e,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),));
              }).toList(),
            ),
            color: Appcolors.bgcolor,)),
        ],
      ),
    );
  }
}
