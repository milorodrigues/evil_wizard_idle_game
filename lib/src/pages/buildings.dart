import 'package:flutter/material.dart';
import '../../main.dart';

class BuildingsPage extends StatelessWidget {
  const BuildingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("buildings page"),
            ],
          ),
        ),
      )
    );
  }
}