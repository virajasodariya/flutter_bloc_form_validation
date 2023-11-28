import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/Bloc/login_bloc.dart';
import 'package:flutter_bloc_form_validation/View/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const MaterialApp(
        home: WelcomeScreen(),
      ),
    );
  }
}
