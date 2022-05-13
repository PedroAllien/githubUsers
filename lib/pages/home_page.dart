import 'package:desafio/blocs/categorias_bloc.dart';
import 'package:desafio/blocs/categorias_events.dart';
import 'package:desafio/blocs/categorias_state.dart';
import 'package:desafio/blocs/usuarios_event.dart';
import 'package:desafio/blocs/usuarios_state.dart';
import 'package:desafio/components/card_categoria_widget.dart';
import 'package:desafio/components/card_user_widget.dart';
import 'package:desafio/components/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/usuarios_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CategoriaBloc blocCategoria;
  late final UsuarioBloc blocUsuario;

  @override
  void initState() {
    super.initState();
    blocCategoria = CategoriaBloc();
    blocUsuario = UsuarioBloc();
    blocCategoria.add(LoadCategoriaEvent());
    blocUsuario.add(LoadUsuarioEvent());
  }

  @override
  void dispose() {
    blocCategoria.close();
    blocUsuario.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff053D56),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: size.height * 0.07,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox.fromSize(
                child: Image.network(
                    'https://media-exp1.licdn.com/dms/image/C4D03AQEdIGuNf3WLjA/profile-displayphoto-shrink_800_800/0/1646329899648?e=1657756800&v=beta&t=MFPPl7pPTCe5S96qeL55XYrTmSXo2qx7SEcMl09pOaI',
                    fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: size.height - (size.height * 0.07),
              width: size.width * 1,
              padding: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color(0xffF6F6F6),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text(
                        "Hi, Pedro",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: SearchInput(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Category",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 121, 121, 121)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: BlocBuilder<CategoriaBloc, CategoriaState>(
                          bloc: blocCategoria,
                          builder: (context, state) {
                            if (state is CategoriaInitialState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is CategoriaSuccessState) {
                              final categoriaList = state.categorias;
                              return SizedBox(
                                height: 140,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoriaList.length,
                                    itemBuilder: (context, index) {
                                      return CardCategoria(
                                        image: categoriaList[index].image,
                                        numRepo:
                                            categoriaList[index].repositorios,
                                        tipoCategoria:
                                            categoriaList[index].tipo,
                                      );
                                    }),
                              );
                            }
                            return Container();
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Users",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 121, 121, 121)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: BlocBuilder<UsuarioBloc, UsuarioState>(
                          bloc: blocUsuario,
                          builder: (context, state) {
                            if (state is UsuarioInitialState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is UsuarioSuccessState) {
                              final usuarioList = state.usuarios;
                              return SizedBox(
                                height: size.height * 0.4,
                                child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    itemCount: usuarioList.length,
                                    itemBuilder: (context, index) {
                                      return UsuarioCard(
                                        usuario: usuarioList[index],
                                      );
                                    }),
                              );
                            }
                            return Container();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
