import 'dart:convert';

import 'package:desafio/models/usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioRepository {
  final List<Usuario> _usuarios = [];
  var url = Uri.parse("https://api.github.com/users");

  Future<List<Usuario>> loadUsuarios() async {
    var resposta = await http.get(url);

    for (var usuario in jsonDecode(resposta.body)) {
      Usuario user = Usuario(
        nome: usuario["login"],
        image: usuario["avatar_url"],
        url: usuario["url"],
      );

      _usuarios.add(user);
    }

    return _usuarios;
  }
}
