//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';



class Bird extends Equatable{
  final String id;
  final String name;
  final String image;

  const Bird({
    required this.id,
    required this.name,
    required this.image,
  });
//va comparer l'état plus tard
  @override
  List<Object?> get props => [id, name, image];

static final List<Bird> birds = [
 const Bird(
    id:'0',
    name: 'Bird bleu',
    image: 'assets/bird.png', 
  ),
  const Bird(
    id:'1',
    name: 'Bird vert',
    image: 'assets/OIP.png', 
  ),
  const Bird(
    id:'2',
    name: 'Bird orange',
    image: 'assets/bird-2.png', 
  ),
];
}