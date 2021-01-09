import 'package:flutter/material.dart';
import 'package:kidsgame/home.dart';
import 'package:kidsgame/levelOne.dart';
import 'package:kidsgame/levelTwo.dart';
import 'package:kidsgame/map.dart';
import 'Choices.dart';

import 'package:flutter/services.dart';
main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Dongol'),
      home: Home(),
    );
  }
}

