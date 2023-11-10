import 'package:flutter/material.dart';
import 'Gamepage.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
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
                      "WHO IS PLAYING FIRST?",
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
                                  builder: (context) => MyHomePage(oturn, "X"),
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
                              "X",
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
                                  builder: (context) => MyHomePage(oturn, "O"),
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
                              "O",
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
