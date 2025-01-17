import 'package:flutter/material.dart';

class MoviesErrorView extends StatelessWidget {
  final String message;
  const MoviesErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
