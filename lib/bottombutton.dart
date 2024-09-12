import 'package:flutter/material.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 72,
        width: 425,
        decoration: const BoxDecoration(
          color: Color(0xFF000000),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          border: Border(
            left: BorderSide(
              color: Color(0xFF000000),
              width: 55,
            ),
            top: BorderSide(
              color: Color(0xFF000000),
              width: 18,
            ),
            right: BorderSide(
              color: Color(0xFF000000),
              width: 55,
            ),
            bottom: BorderSide(
              color: Color(0xFF000000),
              width: 18,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/download_removebg_preview_191.png',
              width: 43,
              height: 36,
            ),
            Image.asset(
              'assets/images/windows-10.png',
              width: 43,
              height: 40,
            ),
            Image.asset(
              'assets/images/download_removebg_preview_201.png',
              width: 28,
              height: 28,
            ),
          ],
        ),
      ),
    );
  }
}
