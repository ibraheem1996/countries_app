import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coor/dependency/dependency_get_it.dart';
import 'features/home/logic/home_cubit.dart';
import 'features/home/ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (context) => getIt<HomeCubit>(), child: const HomePage()),
    );
  }
}
