import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sssdfgh extends StatefulWidget {
  const sssdfgh({super.key});

  @override
  State<sssdfgh> createState() => _sssdfghState();
}

class _sssdfghState extends State<sssdfgh> {
  SharedPreferences? pr;
  List<Color> coloors = [Colors.red, Colors.green];

  void initState() {
    super.initState();
    getshareprefrence();
  }

  getshareprefrence() async {
    pr = await SharedPreferences.getInstance();
  }

  String value = "";
  TextEditingController setvalue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: TextField(
                controller: setvalue,
              ),
            ),
            Container(
                child: ElevatedButton(
                    onPressed: () {
                      pr!.setString("color", setvalue.text);
                    },
                    child: Text("set"))),
            Container(
              child: Text(value),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      value = pr!.getString("color") ?? "Default";
                    });
                  },
                  child: Text("get")),
            ),
          ],
        ),
      ),
    );
  }
}
