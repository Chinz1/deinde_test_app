part of 'dog_bloc.dart';

abstract class DogState extends Equatable {
  @override
  List<Object> get props => [];
}

class DogInitialState extends DogState {}

class DogLoadingState extends DogState {}

class DogLoadedState extends DogState {
  final String imageUrl;

  DogLoadedState({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}

class DogErrorState extends DogState {
  final String error;

  DogErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

