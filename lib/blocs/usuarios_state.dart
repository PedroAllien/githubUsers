import 'package:desafio/models/usuario.dart';

abstract class UsuarioState {
  List<Usuario> usuarios;

  UsuarioState({
    required this.usuarios,
  });
}

class UsuarioInitialState extends UsuarioState {
  UsuarioInitialState() : super(usuarios: []);
}

class UsuarioSuccessState extends UsuarioState {
  UsuarioSuccessState({required List<Usuario> users}) : super(usuarios: users);
}
