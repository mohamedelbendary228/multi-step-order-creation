import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Order Creation",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
