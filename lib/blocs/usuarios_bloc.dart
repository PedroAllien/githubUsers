import 'package:bloc/bloc.dart';
import 'package:desafio/blocs/usuarios_event.dart';
import 'package:desafio/blocs/usuarios_state.dart';
import 'package:desafio/repositories/usuarios_repository.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final _usuarioRep = UsuarioRepository();

  UsuarioBloc() : super(UsuarioInitialState()) {
    on<LoadUsuarioEvent>(
      (event, emit) async =>
          emit(UsuarioSuccessState(users: await _usuarioRep.loadUsuarios())),
    );
  }
}
