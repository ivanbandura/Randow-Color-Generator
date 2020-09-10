import 'package:flutter/material.dart';
import 'package:random_color_solid/generated/l10n.dart';
import 'package:random_color_solid/multicolor_page.dart';
import 'package:random_color_solid/random_color.dart';
import 'package:random_color_solid/color_widget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color color;
  String hexValue;
  int startIndex = 10;
  int endIndex = 16;

  @override
  void initState() {
    generatedColor();
    super.initState();
  }

  void generatedColor() {
    color = randomColorGenerator();
    hexValue = color.toString().substring(startIndex, endIndex).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
            onTap: () {
              setState(() {
                generatedColor();
              });
            },
            child: ColorContainer(bgColor: color, hexValue: hexValue)),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return new MultiColorPage(backgroundColor: color);
              },
              fullscreenDialog: true));
        },
        child: Container(
          width: double.infinity,
          height: 80.0,
          color: Colors.blueGrey,
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              S.of(context).goToMulticolor,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Title"),
            ),
          ),
        ),
      ),
    );
  }
}
