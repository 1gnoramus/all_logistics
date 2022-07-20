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
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
