import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color_solid/generated/l10n.dart';

class ColorContainer extends StatelessWidget {
  final Color bgColor;
  final String hexValue;
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(S.current.copied),
    duration: Duration(seconds: 3),
  );

  ColorContainer({@required this.bgColor, @required this.hexValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor,
      child: GestureDetector(
        onLongPress: () {
          Clipboard.setData(new ClipboardData(text: "#" + hexValue));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('"${S.of(context).heyThere}!"',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Title")),
            Text(
              "#" + hexValue,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
