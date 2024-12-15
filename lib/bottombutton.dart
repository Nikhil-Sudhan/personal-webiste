import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 72,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
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
