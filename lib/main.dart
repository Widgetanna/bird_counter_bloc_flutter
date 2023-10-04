import 'package:bird_counter_block_flutter/bloc/bird_bloc.dart';
import 'package:bird_counter_block_flutter/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  final birdBloc = BirdBloc();
  runApp(
    BlocProvider(
     create: (context) => birdBloc..add(LoadBirdCounter()),
      child: const  MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
));
    
    return MaterialApp(
      title: 'Bird Bloc',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 57, 32, 115)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
     
    );
  }
}

