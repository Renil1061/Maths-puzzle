import 'package:flutter/material.dart';

import 'package:mp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sp.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  SharedPreferences? pref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs();
  }

  prefs() async {
    pref = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          itemCount: 75,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            //[clear,skip,pending]
            String levelsttsu = maths.statuslist[index];

            int? level = maths.sp!.getInt("level") ?? 0;

            //==level

            if (levelsttsu == maths.Isclear) {
              return InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return asdff(index);
                    },
                  ));
                },
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return asdff(index);
                      },
                    ));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 40),
                    )),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Images/tick.png"))),
                  ),
                ),
              );
            } else if (levelsttsu == maths.Isskip) {
              return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return asdff(index);
                      },
                    ));
                  },
                  child: Container(
                    child: Center(
                      child:
                          Text("${index + 1}", style: TextStyle(fontSize: 40)),
                    ),
                  ));
            } else {
              if (level == index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return asdff(index);
                        },
                      ));
                    },
                    child: Container(
                      child: Center(
                        child: Text("${index + 1}",
                            style: TextStyle(fontSize: 40)),
                      ),
                    ));
              }
            }
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("Images/lock.png"))),
            );
          },
        ),
      ),
    );
  }
}
