import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp/WP.dart';
import 'package:mp/main.dart';

import 'package:shared_preferences/shared_preferences.dart';

class asdff extends StatefulWidget {
  int level;

  asdff(int this.level);

  @override
  State<asdff> createState() => _asdffState();
}

class _asdffState extends State<asdff> {
  List<String> anslist = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Images/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (maths.statuslist[widget.level] == maths.Isclear) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Material(
                                  child: Text(
                                    "This Level Already Clear",
                                  )),
                            );
                          },
                        );
                      } else {showSkipConfirmationDialog(context);
                        // maths.sp!
                        //     .setString("status${widget.level}", maths.Isskip);
                        // maths.statuslist[widget.level] = maths.Isskip;
                        // maths.sp!;
                        //
                        // print("===${maths.statuslist}");
                        // widget.level = widget.level + 1;
                        // Navigator.pushReplacement(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return asdff(widget.level);
                        //   },
                        // ));
                      }
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Image(
                          image: AssetImage("Images/skip.png"),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      child: Center(
                          child: Text(
                            "PUZZLE ${widget.level! + 1}",
                            style: TextStyle(fontSize: 20),
                          )),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Images/level_board.png"),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: AssetImage("Images/hint.png"),
                      ))
                ],
              ),
              Expanded(
                child: Container(
                  height: 540,
                  width: 340,
                  child: Image(
                    image: AssetImage("Images/p${widget.level + 1}.png"),
                  ),
                ),
              ),
              Row(children: [
                Expanded(
                  child: Container(
                      child: Center(
                        child: Text(
                          disply,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white)),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (disply.isNotEmpty) {
                          disply = disply.substring(0, disply.length - 1);
                        }
                      });
                    },
                    child: Container(
                        height: 50, child: Image.asset("Images/delete.png"))),
                TextButton(
                    onPressed: () {
                      // print("BEFORE==LEVEL==${widget.level}");

                      // Clear , Skip

                      if (disply == anslist[widget.level]) {
                        String levelstatus = maths.statuslist[widget.level];

                        if (levelstatus == maths.Isclear) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return wp(widget.level);
                            },
                          ));
                        } else if (levelstatus == maths.Isskip) {
                          maths.sp!.setString(
                              "status${widget.level}", maths.Isclear);
                          maths.statuslist[widget.level] = maths.Isclear;

                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return wp(widget.level);
                            },
                          ));
                        } else {
                          maths.sp!.setString(
                              "status${widget.level}", maths.Isclear);
                          maths.statuslist[widget.level] = maths.Isclear;
                          widget.level = widget.level + 1;
                          maths.sp!.setInt("level", widget.level);
                          print("===${maths.statuslist}");
                          print("AFTER==LEVEL==${widget.level}");
                          print("==WON==");
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return wp(widget.level - 1);
                            },
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Wrong! Please Fill Right")));
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ))
              ]),
              Row(
                children: Mybutton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> Mybutton() {
    List<Widget> list = [];

    for (int i = 0; i < 10; i++) {
      list.add(Expanded(
          child: InkWell(
              onTap: () {
                setState(() {
                  disply = disply + "$i";
                });
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                      "$i",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ))));
    }

    return list;
  }
 showSkipConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Are you sure you want to skip this level?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the logic for skipping the level here
                maths.sp!.setString("status${widget.level}", maths.Isskip);
                maths.statuslist[widget.level] = maths.Isskip;
                maths.sp!;
                widget.level = widget.level + 1;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return asdff(widget.level);
                    },
                  ),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }



  String disply = "";

// Future<void> saveleveltoshareprefrence(int? level) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setInt("level", level!);
// }
}
