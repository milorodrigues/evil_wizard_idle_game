import 'package:evil_wizard_idle_game/main.dart';
import 'package:flutter/material.dart';

class BuildingsPage extends StatefulWidget {
  const BuildingsPage({super.key});

  @override
  State<StatefulWidget> createState() => BuildingsPageState();
}

class BuildingsPageState extends State<BuildingsPage> {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
  final List<int> colorCodes = <int>[600, 500, 100, 30, 30, 30, 30, 30, 30];

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
            Flexible(
                child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [const Spacer(), Text('Entry ${entries[index]}'), const Spacer(), Text('${colorCodes[index]}'), const Spacer()],
                    ));
              },
            )),
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
  Icon icon;

  Building(this.name, this.cost, this.gainPerUnit, this.icon);

  void buy() {
    amount += BigInt.from(1);
    //AppState.spend(cost);
    //AppState.increaseGain(gainPerUnit);
  }
}

class BuildingWidget extends StatelessWidget {
  final Building building;

  const BuildingWidget({super.key, required this.building});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [const Spacer(), Text(building.name), const Spacer(), building.icon, const Spacer()],
    );
  }
}
