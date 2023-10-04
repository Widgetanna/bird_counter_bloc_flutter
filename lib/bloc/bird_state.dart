part of 'bird_bloc.dart';


abstract class BirdState extends Equatable{
  const BirdState();

  @override
  List<Object> get props => [];
}

class BirdInitial extends BirdState{}

class BirdLoaded extends BirdState{
  final List<Bird> birds;
  const BirdLoaded ({required this.birds});
  //pour que bloc puisse comparer des états
  @override
  List<Object>get props => [birds];
}
