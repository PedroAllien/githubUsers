import 'package:desafio/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioCard extends StatefulWidget {
  final Usuario usuario;
  const UsuarioCard({Key? key, required this.usuario}) : super(key: key);

  @override
  State<UsuarioCard> createState() => _UsuarioCardState();
}

class _UsuarioCardState extends State<UsuarioCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 100,
            width: size.width * 1,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.network(
                  widget.usuario.image,
                  height: 70,
                  width: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          widget.usuario.nome,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Github",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[400]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ]),
    );
  }
}
