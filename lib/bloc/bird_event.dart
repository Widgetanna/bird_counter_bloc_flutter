part of 'bird_bloc.dart';


abstract class BirdEvent extends Equatable{
  const BirdEvent();

  @override
  List<Object> get props => [];
}
class LoadBirdCounter extends BirdEvent{

}
class AddBird extends BirdEvent{
  final Bird bird;
  
  const AddBird (this.bird);

  @override
  List<Object>get props => [bird];

}
class RemoveBird extends BirdEvent{
   final Bird bird;
   const RemoveBird(this.bird);

@override
List<Object>get props => [bird];

}