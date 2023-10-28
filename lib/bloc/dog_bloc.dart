import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'dog_event.dart';
part 'dog_state.dart';


class DogBloc extends Bloc<DogEvent, DogState> {
  DogBloc() : super(DogInitialState());

  @override
  Stream<DogState> mapEventToState(DogEvent event) async* {
    if (event is FetchDogEvent) {
      yield DogLoadingState();
      try {
        final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final imageUrl = data['message'];
          yield DogLoadedState(imageUrl: imageUrl);
        } else {
          yield DogErrorState(error: 'Failed to load image');
        }
      } catch (e) {
        yield DogErrorState(error: 'Error: $e');
      }
    }
  }
}

