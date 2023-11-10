// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class vsAI extends StatefulWidget {
  bool o;
  String s;
  vsAI(this.o, this.s);
  @override
  State<vsAI> createState() => _vsAIState(o, s);
}

class _vsAIState extends State<vsAI> {
  bool oturn;
  bool winnerDeclared = false;
  String turn;
  _vsAIState(this.oturn, this.turn);
  List output = ["", "", "", "", "", "", "", "", "", "", "", ""];
  List filepath = [
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png",
    "assets/img/Box.png"
  ];
  bool draw = true;
  int filledbox = 0;
  int xscore = 0;
  int oscore = 0;

  @override
  void initState() {
    super.initState();
    // Add this code to make the AI's first move
    if (oturn) {
      // Make AI move (AI's turn)
      makeAIMove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB1293C),
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
              fontFamily: "inter",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          color: Color(0xffFFE087),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "YOUR SCORE (X)",
                          style: TextStyle(
                            fontFamily: "inter",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${xscore}",
                          style: TextStyle(
                            fontFamily: "inter",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "AI SCORE (O)",
                          style: TextStyle(
                            fontFamily: "inter",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${oscore}",
                          style: TextStyle(
                            fontFamily: "inter",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: 300,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Clicked(index);
                      },
                      child: Container(
                        child: Center(
                          child: Image.asset(filepath[index]),
                        ),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow),
                            color: Color(0xffB1293C)),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 56,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Player ${turn}'s Turn",
                    style: TextStyle(
                      fontFamily: "inter",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Clicked(int index) {
    if (output[index] == "" && draw) {
      setState(() {
        if (oturn && output[index] == "") {
          filepath[index] = "assets/img/O.jpg";
          output[index] = "O";
          filledbox += 1;
        } else if (!oturn && output[index] == "") {
          filepath[index] = "assets/img/X.jpg";
          output[index] = "X";
          filledbox += 1;
        }
        oturn = !oturn;
        if (oturn) {
          turn = "O";
          // Make AI move (AI's turn)
          makeAIMove();
        } else {
          turn = "X";
        }
        Winner();
      });
    }
  }

  Winner() {
    if (winnerDeclared) return;
    //Row
    for (int i = 0; i < 8; i += 3) {
      if (output[i] != "" &&
          output[i] == output[i + 1] &&
          output[i] == output[i + 2]) {
        draw = false;
        Future.delayed(Duration(seconds: 2));
        WinnerDeclration(output[i]);
      }
    }
    //Column
    for (int i = 0; i < 3; i++) {
      if (output[i] != "" &&
          output[i] == output[i + 3] &&
          output[i] == output[i + 6]) {
        draw = false;
        Future.delayed(Duration(seconds: 2));
        WinnerDeclration(output[i]);
      }
    }
    //Diagonal
    if (output[0] != "" && output[0] == output[4] && output[0] == output[8]) {
      draw = false;
      Future.delayed(Duration(seconds: 2));
      WinnerDeclration(output[0]);
    }
    if (output[2] != "" && output[2] == output[4] && output[2] == output[6]) {
      draw = false;
      Future.delayed(Duration(seconds: 2));
      WinnerDeclration(output[2]);
    } else if (filledbox == 9 && draw != false) {
      Future.delayed(Duration(seconds: 2));
      WinnerDeclration("No One");
    }
  }

  WinnerDeclration(String winner) {
    if (winnerDeclared == true) {
      return;
    }
    if (winner == "X" || winner == "O") {
      showModalBottomSheet(
          isDismissible: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/img/Trophy.png"),
                    Text(
                      "Player ${winner} Won",
                      style: TextStyle(
                          fontFamily: "inter",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "Your Path to Victory: Tic Tac Toe's Unbeatable Champion!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff757575),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (winner == "X") {
                              xscore += 1;
                            } else if (winner == "O") {
                              oscore += 1;
                            }
                            ClearGrid();
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color(0xff005BC0),
                          ),
                          child: Center(
                              child: Text(
                            "RESTART",
                            style: TextStyle(
                              fontFamily: "inter",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    } else if (winner == "No One") {
      showModalBottomSheet(
          isDismissible: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/img/Logo.png"),
                    Text(
                      "It's a Draw!",
                      style: TextStyle(
                          fontFamily: "inter",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "Congrats to both of you for equally excelling in the art of not winning",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff757575),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            ClearGrid();
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color(0xff005BC0),
                          ),
                          child: Center(
                              child: Text(
                            "REPLAY",
                            style: TextStyle(
                              fontFamily: "inter",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }
    winnerDeclared = true;
  }

  ClearGrid() {
    output = ["", "", "", "", "", "", "", "", "", "", "", ""];
    oturn = true;
    filepath = [
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png",
      "assets/img/Box.png"
    ];
    filledbox = 0;
    turn = "O";
    draw = true;
    winnerDeclared = false;
    if (oturn) {
      // Make AI move (AI's turn)
      makeAIMove();
    }
  }

  // New method to make the AI's move using the Minimax algorithm
  void makeAIMove() {
    if (!draw || winnerDeclared == true)
      return; // Stop making moves if there's a winner

    int bestScore = -9999;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (output[i] == "") {
        output[i] = "O";
        int score = minimax(output, 0, false);
        output[i] = "";
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (bestMove != -1) {
      Clicked(bestMove);
    }
  }

  bool checkforwinmark(String mark) {
    // Check rows for a win
    for (int i = 0; i < 9; i += 3) {
      if (output[i] == mark && output[i + 1] == mark && output[i + 2] == mark) {
        return true;
      }
    }

    // Check columns for a win
    for (int i = 0; i < 3; i++) {
      if (output[i] == mark && output[i + 3] == mark && output[i + 6] == mark) {
        return true;
      }
    }

    // Check diagonals for a win
    if (output[0] == mark && output[4] == mark && output[8] == mark) {
      return true;
    }
    if (output[2] == mark && output[4] == mark && output[6] == mark) {
      return true;
    }

    return false;
  }

  bool checkfordraw() {
    for (String item in output) {
      if (item == "") {
        return false; // There's an empty cell, so the game is not a draw.
      }
    }
    return true; // All cells are filled, and no player has won, so it's a draw.
  }

  // Minimax algorithm to calculate the best move
  int minimax(List board, int depth, bool isMaximizing) {
    if (checkforwinmark("O")) {
      return 10;
    } else if (checkforwinmark("X")) {
      return -10;
    } else if (checkfordraw()) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == "") {
          board[i] = "O";
          int score = minimax(board, depth + 1, false);
          board[i] = "";
          if (score > bestScore) {
            bestScore = score;
          }
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == "") {
          board[i] = "X";
          int score = minimax(board, depth + 1, true);
          board[i] = "";
          if (score < bestScore) {
            bestScore = score;
          }
        }
      }
      return bestScore;
    }
  }
}
