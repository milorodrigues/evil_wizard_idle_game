import 'package:flutter/material.dart';

class AscensionPage extends StatelessWidget {
  const AscensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("ascension page"),
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