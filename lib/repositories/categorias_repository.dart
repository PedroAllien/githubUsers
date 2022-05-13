import '../models/categoria.dart';

class CategoriaRepository {
  final List<Categoria> _categorias = [];

  List<Categoria> loadCategorias() {
    _categorias.addAll([
      Categoria(
        tipo: 'Javascript',
        image: "assets/images/javascript.svg",
        repositorios: 98,
      ),
      Categoria(
        tipo: 'Java',
        image: "assets/images/java.svg",
        repositorios: 105,
      ),
      Categoria(
        tipo: 'Flutter',
        image: "assets/images/flutter.svg",
        repositorios: 57,
      ),
      Categoria(
        tipo: 'Python',
        image: "assets/images/python.svg",
        repositorios: 38,
      ),
    ]);
    return _categorias;
  }
}
