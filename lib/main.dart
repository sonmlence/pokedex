import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled1/calculator_screen.dart';
import 'package:untitled1/dattebayo/dattebayo_screen.dart';
import 'package:untitled1/harry/harry_screen.dart';
import 'package:untitled1/pokemon_screen.dart';

import 'harry/model/harry_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(HarryModelAdapter());

  await Hive.openBox<List>('harry_box');


  runApp(const MaterialApp(home: HarryScreen(),));
}