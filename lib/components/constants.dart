import 'package:flutter/material.dart';

const kOrderTitleTextStyle =
    TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.black);

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

const List<String> foldersList = [
  'Информация в дорогу',
  'Шаблоны сопроводительных \n документов',
  'Разное'
];

const List<String> roadInfoFolder = [
  'Состояние дорог',
  'Требования к транспорту',
  'Правила дорожного движения',
  'Пункты ТО',
  'Пункты для отдыха'
];

const List<String> docsExamplesFolder = [
  'Пример накладной',
  'Шаблон путевого листа',
  'Товарно-транспортная накладная',
  'Инвойс',
];
const List<String> stuffFolder = [
  'Журнал от KazNews 06.02.1988',
  'Журнал от KazNews 22.12.2018',
  'Брошюра от Merch 06.02.1988',
  'Газета от KazMagaz 06.02.1988',
  'Сканворд "Дед"',
];
