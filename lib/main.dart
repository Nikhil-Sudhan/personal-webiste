import 'package:flutter/material.dart';
import 'package:website/bottombutton.dart';
import 'package:website/topbutton.dart';
import 'package:website/wallpapaer.dart';
import 'package:website/home.dart';

// Custom ScrollPhysics to disable upward scrolling once moved to the second page
class NoBackScrollPhysics extends ScrollPhysics {
  const NoBackScrollPhysics({super.parent});

  @override
  NoBackScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoBackScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    // Allow scrolling down when not at the bottom
    if (position.pixels == position.minScrollExtent) {
      return true;
    }

    // Prevent scrolling up when not at the top
    if (position.pixels == position.maxScrollExtent) {
      return false;
    }

    return super.shouldAcceptUserOffset(position);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (offset > 0) {
      // Allow scrolling down
      return offset;
    } else if (position.pixels <= position.minScrollExtent && offset < 0) {
      // Prevent scrolling up if at the top of the list (first page)
      return 0;
    }

    return super.applyPhysicsToUserOffset(position, offset);
  }
}

void main() => runApp(const Lock());

class Lock extends StatefulWidget {
  const Lock({super.key});

  @override
  State<Lock> createState() => _LockState();
}

class _LockState extends State<Lock> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 42), // Set height only
          child: Center(
            child: SizedBox(
              width: 425,
              child: const Topbutton(),
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                width: 425,
                height: 740,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  physics: const NoBackScrollPhysics(),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF0A0A0A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Wallpapaer(), // First page
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF0A0A0A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const LumiaUI(), // Second page
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 425,
                height: 60, // Set desired height for the container
                color: const Color.fromARGB(255, 255, 255, 255), // Set background color for the container
                child: const Center(
                  child: bottom()
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
