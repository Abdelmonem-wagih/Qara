import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/Feature/ToDO/cubit/muilt_state/cubit/multi_state_cubit.dart';
import 'package:qara/Feature/ToDO/cubit/muilt_state/cubit_observer.dart';
import 'package:qara/Feature/ToDO/screens/home_screen.dart';

void main() {
  Bloc.observer = MyCubitObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MultiStateCubit()..loadItems([]),
        child: HomeScreen(),
      ),
    );
  }
}
