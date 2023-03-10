import 'package:flutter/material.dart';

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
            children: [
              const Text("buildings page"),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {Navigator.pop(context)},
              ),
            ],
          ),
        ),
      )
    );
  }
}