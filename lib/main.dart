import 'package:flutter/material.dart';

import 'coor/dependency/dependency_get_it.dart';
import 'features/home/ui/home.dart';

void main () {
 WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}) ;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: const HomePage(),
    );
  }
}