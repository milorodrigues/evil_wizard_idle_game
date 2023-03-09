import 'package:flutter/material.dart';
import '../../main.dart';
import '../asciiart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('You are an evil wizard.'),
              const Spacer(),
              const Text(Assets.asciiWizard),
              const Spacer(),
              const SpellsWidget(),
              const Spacer(),
              const IncreaseInfoWidget(),
              const Spacer(),
              TextButton(
                onPressed: () => {debugPrint('pressed button')},
                child: const Text('test button')),
            ],
          ),
        ),
      )
    );
  }
}

class SpellsWidget extends StatefulWidget {
  const SpellsWidget({super.key});
  
  @override
  State<StatefulWidget> createState() => SpellsWidgetState();
}

class SpellsWidgetState extends State<SpellsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: GameState.spells,
          builder: (context, value, widget) {return Text(GameState.spells.value.toString());}),
        const Text('evil spells'),
      ],
    );
  }
}

class IncreaseInfoWidget extends StatefulWidget {
  const IncreaseInfoWidget({super.key});
  
  @override
  State<StatefulWidget> createState() => IncreaseInfoWidgetState();
}

class IncreaseInfoWidgetState extends State<IncreaseInfoWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: GameState.gain,
          builder: (context, value, widget) {return Text('Casting ${GameState.gain.value} evil spells per second');}),
      ],
    );
  }
}
