import 'package:bird_counter_block_flutter/models/bird_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bird_event.dart';
part 'bird_state.dart';

class BirdBloc extends Bloc<BirdEvent, BirdState> {
  BirdBloc() : super(BirdInitial()) {
    on<LoadBirdCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const BirdLoaded(birds: <Bird>[])); 
    });

    on<AddBird>((event, emit) {
      BirdLoaded? state = this.state as BirdLoaded?;
      if (state != null) {
        emit(
          BirdLoaded(
            //un nouveau etat
            birds: List.from(state.birds)..add(event.bird),
          ),
        );
      }
    });

    on<RemoveBird>((event, emit) {
  if (state is BirdLoaded) {
    final state = this.state as BirdLoaded;
    final updatedBirds = <Bird>[]; 
    bool birdRemoved = false;

    for (final bird in state.birds) {
     if (!birdRemoved && bird == event.bird) {
            // Supprime un seul oiseau
            birdRemoved = true;
          } else {
            updatedBirds.add(bird);
          }
        }

    emit(BirdLoaded(
      birds: updatedBirds,
    ));
  }
});

  }
}
