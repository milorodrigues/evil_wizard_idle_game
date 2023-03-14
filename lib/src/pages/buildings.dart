import 'package:evil_wizard_idle_game/main.dart';
import 'package:flutter/material.dart';

class BuildingsPage extends StatefulWidget {
  const BuildingsPage({super.key});

  @override
  State<StatefulWidget> createState() => BuildingsPageState();
}

class BuildingsPageState extends State<BuildingsPage> {
  Map<String, Building> buildings = {};

  @override
  void initState() {
    super.initState();
    buildings.addEntries({'Grimoire': Building('Grimoire', BigInt.from(5), BigInt.from(2))}.entries);

    buildings.forEach((key, value) {
      debugPrint('$key: $value');
    });
  }

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
    ));
  }
}

class Building {
  String name = '';
  BigInt amount = BigInt.from(0);
  BigInt cost = BigInt.from(1);
  BigInt gainPerUnit = BigInt.from(1);

  Building(this.name, this.cost, this.gainPerUnit);

  void buy() {
    amount += BigInt.from(1);
    //AppState.spend(cost);
    //AppState.increaseGain(gainPerUnit);
  }
}

class BuildingWidget extends StatelessWidget {
  const BuildingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
