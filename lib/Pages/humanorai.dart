import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Pages/2%20Player/Select.dart';
import 'package:tic_tac_toe/Pages/vs%20AI/first_move_selection.dart';

class HumanOrAI extends StatefulWidget {
  const HumanOrAI({super.key});

  @override
  State<HumanOrAI> createState() => _HumanOrAIState();
}

class _HumanOrAIState extends State<HumanOrAI> {
  bool oturn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/img/bg.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 240,
              height: 80,
              decoration: BoxDecoration(
                  color: Color(0xff735C00),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Center(
                child: Text(
                  "Tic Tac Toe",
                  style: TextStyle(
                      fontFamily: "inter",
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              height: 60,
            ),
            Image.asset("assets/img/Logo.png"),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Choose Your Opponent",
                      style: TextStyle(
                        fontFamily: "inter",
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            oturn = false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Select(),
                                ));
                          },
                          child: Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              "2 Player",
                              style: TextStyle(
                                fontFamily: "inter",
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff735C00),
                              ),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            oturn = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectHuman(),
                                ));
                          },
                          child: Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              "AI",
                              style: TextStyle(
                                fontFamily: "inter",
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB1293C),
                              ),
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
