part of 'sushi_bloc.dart';

abstract class SushiState extends Equatable {
  const SushiState();

  @override
  List<Object> get props => [];
}

class SushiInitial extends SushiState {}

class SushiLoaded extends SushiState {
  final List<Sushi> sushii;

  const SushiLoaded({
    required this.sushii,
  });

  @override
  List<Object> get props => [sushii];
}
