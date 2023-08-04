import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  bool o;
  String s;
  MyHomePage(this.o, this.s);
  @override
  State<MyHomePage> createState() => _MyHomePageState(o, s);
}

class _MyHomePageState extends State<MyHomePage> {
  bool oturn;
  String turn;
  _MyHomePageState(this.oturn, this.turn);
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
                          "PLAYER X SCORE",
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
                          "PLAYER O SCORE",
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
    filledbox += 1;
    setState(() {
      if (oturn == true && output[index] == "") {
        filepath[index] = "assets/img/O.jpg";
        output[index] = "O";
      } else if (oturn == false && output[index] == "") {
        filepath[index] = "assets/img/X.jpg";
        output[index] = "X";
      }
      oturn = !oturn;
      if (oturn == false) {
        turn = "X";
      } else {
        turn = "O";
      }
      Winner();
    });
  }

  Winner() {
    //Row
    for (int i = 0; i < 8; i += 3) {
      if (output[i] != "" &&
          output[i] == output[i + 1] &&
          output[i] == output[i + 2]) {
        draw = false;
        WinnerDeclration(output[i]);
      }
    }
    //Column
    for (int i = 0; i < 3; i++) {
      if (output[i] != "" &&
          output[i] == output[i + 3] &&
          output[i] == output[i + 6]) {
        draw = false;
        WinnerDeclration(output[i]);
      }
    }
    //Diagonal
    if (output[0] != "" && output[0] == output[4] && output[0] == output[8]) {
      draw = false;
      WinnerDeclration(output[0]);
    }
    if (output[2] != "" && output[2] == output[4] && output[2] == output[6]) {
      draw = false;
      WinnerDeclration(output[2]);
    } else if (filledbox == 9 && draw != false) {
      WinnerDeclration("No One");
    }
  }

  WinnerDeclration(String winner) {
    if (winner == "X" || winner == "O") {
      showModalBottomSheet(
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
                            ClearGrid(winner);
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
                            ClearGrid("O");
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
  }

  ClearGrid(String winner) {
    output = ["", "", "", "", "", "", "", "", "", "", "", ""];
    if (winner == "X") {
      oturn = false;
    } else if (winner == "O") {
      oturn = true;
    }
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
    turn = winner;
    draw = true;
  }
}
