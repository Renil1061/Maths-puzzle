import 'package:flutter/material.dart';
import 'package:mp/main.dart';

import 'Sp.dart';

class wp extends StatefulWidget {
  int level;

  wp(int this.level);

  @override
  State<wp> createState() => _wpState();
}

class _wpState extends State<wp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: AssetImage("Images/background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PUZZLE ${widget.level + 1} COMPLETED",
                        style: TextStyle(
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  width: 250,
                  child: Image(
                    image: AssetImage("Images/trophy.png"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          int LVL = maths.sp!.getInt("level")??0;
                      return asdff(LVL);
                    }));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 30),
                    )),
                    margin: EdgeInsets.all(8),
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return maths();
                    }));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "Main Menu",
                      style: TextStyle(fontSize: 30),
                    )),
                    margin: EdgeInsets.all(8),
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return maths();
                    }));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "BuyPro",
                      style: TextStyle(fontSize: 30),
                    )),
                    margin: EdgeInsets.all(8),
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Container(
                    child: Text(
                  "SHARE THIS PUZZLE",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Container(
                  height: 50,
                  width: 50,
                  child: Align(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white, Colors.grey]),
                          image: DecorationImage(
                              image: AssetImage("Images/shareus.png"))),
                    ),
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
