import '../models/categoria.dart';

abstract class CategoriaState {
  List<Categoria> categorias;

  CategoriaState({
    required this.categorias,
  });
}

class CategoriaInitialState extends CategoriaState {
  CategoriaInitialState() : super(categorias: []);
}

class CategoriaSuccessState extends CategoriaState {
  CategoriaSuccessState({required List<Categoria> clients})
      : super(categorias: clients);
}
