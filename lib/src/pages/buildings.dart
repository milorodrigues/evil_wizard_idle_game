import 'package:evil_wizard_idle_game/main.dart';
import 'package:flutter/material.dart';

class BuildingsPage extends StatefulWidget {
  const BuildingsPage({super.key});

  @override
  State<StatefulWidget> createState() => BuildingsPageState();
}

class BuildingsPageState extends State<BuildingsPage> {
  final _gameState = GameState();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: _gameState.buildings.keys.toList().length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    //height: 50,
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [BuildingWidget(building: _gameState.buildings[_gameState.buildings.keys.toList()[index]]!)],
                ));
              },
            )),
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
  ValueNotifier<BigInt> amount = ValueNotifier<BigInt>(BigInt.from(0));
  //BigInt amount = BigInt.from(0);
  BigInt cost = BigInt.from(1);
  BigInt gainPerUnit = BigInt.from(1);
  Icon icon;

  Building(this.name, this.cost, this.gainPerUnit, this.icon);

  void buy(int n) {
    if (BigInt.from(n) * cost <= AppState.gameState.spells.value) {
      debugPrint("Buying $n $name");
      amount.value += BigInt.from(n);
      //amount += BigInt.from(n);
      AppState.gameState.spend(cost * BigInt.from(n));
      AppState.gameState.increaseGain(gainPerUnit * BigInt.from(n));
    } else {
      debugPrint("Not enough spells");
    }
  }
}

class BuildingWidget extends StatelessWidget {
  final Building building;

  const BuildingWidget({super.key, required this.building});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(building.name),
            const Spacer(),
            building.icon,
            const Spacer(),
            ValueListenableBuilder(
                valueListenable: building.amount,
                builder: (context, value, widget) {
                  return Text('${building.amount.value}');
                }),
            //Text(building.amount.value.toString()),
            const Spacer()
          ],
        ),
        ValueListenableBuilder(
            valueListenable: building.amount,
            builder: (context, value, widget) {
              return Text("${building.gainPerUnit} spells per second (Total ${building.gainPerUnit * building.amount.value})");
            }),
        //Text("${building.gainPerUnit} spells per second (Total ${building.gainPerUnit * building.amount})"),
        Text("Cost: ${building.cost} spells"),
        Row(
          children: [
            const Spacer(),
            TextButton(
              child: const Text("x1"),
              onPressed: () {
                building.buy(1);
              },
            ),
            const Spacer(),
            TextButton(
              child: const Text("x10"),
              onPressed: () {
                building.buy(10);
              },
            ),
            const Spacer(),
            TextButton(
              child: const Text("x100"),
              onPressed: () {
                building.buy(100);
              },
            ),
            const Spacer()
          ],
        ),
      ]),
    );
  }
}
