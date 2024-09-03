import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/Feature/ToDO/cubit/singel_state/to_do_cubit.dart';
import 'package:qara/Feature/ToDO/screens/home_screen.dart';

void main() {
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
        create: (context) => ToDoCubit(context),
        child: HomeScreen(),
      ),
    );
  }
}
