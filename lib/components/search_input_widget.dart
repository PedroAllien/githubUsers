import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.75,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: size.width * 0.65,
              height: 50,
              child: const Material(
                elevation: 4.0,
                shadowColor: Colors.grey,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search ..',
                    border: InputBorder.none,
                    // enabled: false,
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.6,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(2, 4),
                    ),
                  ],
                  color: Color(0xff146E64),
                  borderRadius: BorderRadius.circular(4)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
