import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/sushi_model.dart';

part 'sushi_event.dart';
part 'sushi_state.dart';

class SushiBloc extends Bloc<SushiEvent, SushiState> {
  SushiBloc() : super(SushiInitial()) {
    on<LoadSushiCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const SushiLoaded(sushii: <Sushi>[]));
    });
    on<AddSushi>((event, emit) {
      if (state is SushiLoaded) {
        final state = this.state as SushiLoaded;
        emit(
          SushiLoaded(
            sushii: List.from(state.sushii)..add(event.sushi),
          ),
        );
      }
    });
    on<RemoveSushi>((event, emit) {
      if (state is SushiLoaded) {
        final state = this.state as SushiLoaded;
        emit(
          SushiLoaded(
            sushii: List.from(state.sushii)..remove(event.sushi),
          ),
        );
      }
    });
  }
}
