import 'package:flutter/material.dart';

class Constants{

  static newTextTheme(BuildContext context) => Theme.of(context).textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );
}