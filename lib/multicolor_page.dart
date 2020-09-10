import 'package:flutter/material.dart';
import 'package:random_color_solid/generated/l10n.dart';
import 'package:random_color_solid/random_color.dart';

class MultiColorPage extends StatefulWidget {
  Color backgroundColor;

  MultiColorPage({this.backgroundColor});

  @override
  MultiColorPageState createState() =>
      new MultiColorPageState(backgroundsColor: this.backgroundColor);
}

class MultiColorPageState extends State<MultiColorPage> {
  Color backgroundsColor;
  int startIndex = 10;
  int endIndex = 16;

  MultiColorPageState({this.backgroundsColor});

  List<Widget> gridChildrenWidget() {
    List<Widget> gridChildren = <Widget>[];
    for (int i = 0; i < 15; i++) {
      gridChildren.add(Container(
        color: randomColorGenerator(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
              '#${randomColorGenerator().toString().substring(startIndex, endIndex).toUpperCase()}'),
        ),
      ));
    }
    return gridChildren;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: backgroundsColor,
        title: Text(S.of(context).multicolor,
            style: TextStyle(
                fontFamily: 'Title',
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: gridChildrenWidget()),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          height: 80.0,
          color: backgroundsColor,
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              S.of(context).generateColors,
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
