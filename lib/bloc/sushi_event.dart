part of 'sushi_bloc.dart';

abstract class SushiEvent extends Equatable {
  const SushiEvent();

  @override
  List<Object> get props => [];
}

class LoadSushiCounter extends SushiEvent {}

class AddSushi extends SushiEvent {
  final Sushi sushi;

  const AddSushi(
    this.sushi,
  );

  @override
  List<Object> get props => [sushi];
}

class RemoveSushi extends SushiEvent {
  final Sushi sushi;

  const RemoveSushi(
    this.sushi,
  );

  @override
  List<Object> get props => [sushi];
}
