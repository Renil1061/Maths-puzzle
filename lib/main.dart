import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Sp.dart';
import 'levels.dart';

void main() {
  runApp(MaterialApp(
    home: maths(),
    debugShowCheckedModeBanner: false,
  ));
}

class maths extends StatefulWidget {
  static SharedPreferences? sp;
  static List<String> statuslist = [];
  static String Isclear = "clear";
  static String Ispendding = "pending";
  static String Isskip = "skip";

  @override
  State<maths> createState() => _mathsState();
}

class _mathsState extends State<maths> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getttingshareprefrence();
  }

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
          Column(children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MATH PUZZLE",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 540,
                width: 340,
                child: Image(
                  image: AssetImage("Images/blackboard_main_menu.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: BeveledRectangleBorder()),
                            onPressed: () {},
                            child: Icon(
                              Icons.share,
                              color: Colors.black,
                            ))),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: BeveledRectangleBorder()),
                        onPressed: () {},
                        child: Icon(
                          Icons.email_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
          Column(children: [
            Expanded(
              flex: 1,
              child: Row(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return asdff(level!);
                              },
                            ));
                          },
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "chalk",
                                fontSize: 45),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return LevelPage();
                              },
                            ));
                          },
                          child: Text(
                            "LEVELS",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "chalk",
                                fontSize: 45),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BUY PRO",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "chalk",
                              fontSize: 45),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: Row()),
          ]),
        ],
      ),
    ));
  }

  Future<void> getttingshareprefrence() async {
    maths.sp = await SharedPreferences.getInstance();
    setState(() {
      level = maths.sp!.getInt("level") ?? 0;
      maths.statuslist.clear();
    });
    for (int i = 0; i < 75; i++) {
      String levelstatus = maths.sp!.getString("status$i") ?? maths.Ispendding;
      maths.statuslist.add(levelstatus);
    }
    print("===${maths.statuslist}");
  }

  int? level;
}
