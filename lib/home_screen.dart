import 'dart:math';
import 'package:bird_counter_block_flutter/bloc/bird_bloc.dart';
import 'package:bird_counter_block_flutter/models/bird_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bird Bloc'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 85, 136, 208),
      ),
      body: Center(
        child: BlocBuilder<BirdBloc, BirdState>(
          builder: (context, state) {
            if (state is BirdInitial) {
              return const CircularProgressIndicator(
                color: Color.fromARGB(255, 31, 50, 172),
              );
            }
            if (state is BirdLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.birds.length}',
                    style: const TextStyle(
                        fontSize: 60, color: Color.fromARGB(255, 32, 80, 120)),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0; index < state.birds.length; index++)
                          Positioned(
                            left: random.nextInt(250).toDouble(),
                            top: random.nextInt(400).toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                state.birds[index].image,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Contenu de l\'écran d\'accueil');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //bird1
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 29, 83, 159),
            onPressed: () {
              context.read<BirdBloc>().add(AddBird(Bird.birds[0]));
            },
            child: Image.asset('assets/bird.png'),
          ),
          const SizedBox(height: 5),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 118, 152, 201),
            onPressed: () {
              context.read<BirdBloc>().add(RemoveBird(Bird.birds[0]));
            },
            child: const Icon(Icons.remove_circle_outline),
          ),
          //bird2
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 66, 98, 41),
            onPressed: () {
              context.read<BirdBloc>().add(AddBird(Bird.birds[1]));
            },
            child: Image.asset('assets/OIP.png'),
          ),
          const SizedBox(height: 5),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 79, 156, 21),
            onPressed: () {
              context.read<BirdBloc>().add(RemoveBird(Bird.birds[1]));
            },
            child: const Icon(Icons.remove_circle_outline),
          ),
          //bird3
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 131, 71, 11),
            onPressed: () {
              context.read<BirdBloc>().add(AddBird(Bird.birds[2]));
            },
            child: Center(
    child: Padding(
      padding: const EdgeInsets.only(right: 5.0), // Ajoutez une marge de 2 pixels à gauche
      child: Image.asset(
        'assets/bird-2.png',
        width: 40,
      ),
    ),
            ),
          ),
          const SizedBox(height: 5),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 208, 112, 17),
            onPressed: () {
              context.read<BirdBloc>().add(RemoveBird(Bird.birds[2]));
            },
            child: const Icon(Icons.remove_circle_outline),
          ),
        ],
      ),
    );
  }
}
