import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardCategoria extends StatelessWidget {
  final String image;
  final String tipoCategoria;
  final int numRepo;
  const CardCategoria(
      {Key? key,
      required this.image,
      required this.tipoCategoria,
      required this.numRepo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 110,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Color(0xff146E64),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            image,
            height: 40,
            color: Colors.white,
          ),
          Text(
            tipoCategoria,
            style: TextStyle(color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4)),
            child: Text(
              numRepo.toString() + " Repositórios",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
