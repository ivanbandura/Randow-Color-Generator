import 'dart:math';
import 'package:flutter/material.dart';

Color randomColorGenerator() {
  Random random = new Random();
  return Color.fromARGB(
      255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
}
