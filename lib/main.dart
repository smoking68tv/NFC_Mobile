import 'package:flutter/material.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_nfc/widgets/main/main_container.dart';
import 'package:new_nfc/widgets/navidation_drawer/blocs.dart';

import 'configs/ui.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nice Navigation Demo',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: BACKGROUND_COLOR_START),
      home: MainContainerWidget(),
    );
  }
}
