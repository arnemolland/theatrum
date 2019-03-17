import 'package:flutter/material.dart';

class Theatrum {
  static get theme {
    return ThemeData(
      primaryColor: Colors.white,
      accentColor: Color(0xFFf472e8),
      fontFamily: 'ElegantLux'
    );
  }
  
  static get titleStyle {
    return TextStyle(
      fontSize: 24,
      color: Colors.black87,
      letterSpacing: 20
    );
  }
}

const Color darkText = Color.fromRGBO(0, 0, 0, 0.87);
const Color lightText = Color.fromRGBO(255, 255, 255, 0.87);
const Color background = Color.fromRGBO(225, 228, 229, 1.0);
const Color lightGrey = Color.fromRGBO(0, 0, 0, 0.05);