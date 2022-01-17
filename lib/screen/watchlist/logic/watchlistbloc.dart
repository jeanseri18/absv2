import 'package:abidjanstreaming/data/model/film.dart';
import 'package:abidjanstreaming/data/repositories/filmRepository.dart';
import 'package:abidjanstreaming/data/services/ApiService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  FilmBloc() : super(FilmState()); 

  Stream<FilmState> mapEventToState(FilmEvent event) async* {
    if (event is GetCategoryEvent) {
      try {
        yield LoadingFilm();
        await Future.delayed(const Duration(seconds: 2));
        final data = await APIWeb().load(FilmRepository.load(
            'api/filmlist.php?idcategorie=' + event.idcategorie!));
        yield FilmState(Films: data);
      } catch (e) {
        yield FailureFilm(e.toString());
      }
    }
  }
}

abstract class FilmEvent {}

class GetCategoryEvent extends FilmEvent {
  String? idcategorie;

  GetCategoryEvent({this.idcategorie});
}

//state
class FilmState {
  final List<Film>? Films;

  const FilmState({this.Films});

  factory FilmState.initial() => FilmState();
}

class FailureFilm extends FilmState {
  final String error;

  FailureFilm(this.error);
}

class LoadingFilm extends FilmState {}
