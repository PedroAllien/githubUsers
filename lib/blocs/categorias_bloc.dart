import 'package:bloc/bloc.dart';
import 'package:desafio/blocs/categorias_events.dart';
import 'package:desafio/blocs/categorias_state.dart';
import 'package:desafio/repositories/categorias_repository.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  final _categoriaRep = CategoriaRepository();

  CategoriaBloc() : super(CategoriaInitialState()) {
    on<LoadCategoriaEvent>(
      (event, emit) =>
          emit(CategoriaSuccessState(clients: _categoriaRep.loadCategorias())),
    );
  }
}
