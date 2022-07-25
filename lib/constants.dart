import 'package:flutter/material.dart';

const kOrderTitleTextStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black);

const kOrderMainInfTextStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w100, color: Colors.grey);

const kBottomPanelTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
    borderSide: BorderSide.none,
  ),
);
