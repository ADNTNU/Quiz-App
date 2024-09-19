import 'package:flutter/material.dart';

/// A wrapper for the pages of the application.
/// Contains a gradient background
class PageWrapper extends StatelessWidget {
  final Widget child;
  final String title;

  const PageWrapper({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        //   backgroundColor: Colors.transparent,
        // ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: child,
        ),
      );
  }
}