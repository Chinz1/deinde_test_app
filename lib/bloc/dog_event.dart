part of 'dog_bloc.dart';

abstract class DogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDogEvent extends DogEvent {}
