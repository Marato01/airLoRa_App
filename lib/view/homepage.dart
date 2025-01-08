import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/switch_provider/switch_provider.dart';
import 'body/turnoff_bluetooth_screen/screen_turnoff_bluetooth.dart';
import 'body/turnon_bluetooth_screen/screen_turnon_bluetooth.dart';
import 'header/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final bleProvider = Provider.of<BluetoothSwitchProvider>(context);

    final heightSize = MediaQuery.of(context).size.height * 0.20;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03,
        ),
        child: Column(
          children: [

            const Header(),

            bleProvider.blueSwitch
                ? const SizedBox()
                : SizedBox(height: heightSize),

            bleProvider.blueSwitch
                ? const ScreenTurnOnBluetooth()
                : const ScreenTurnoffBluetooth(),
          ],
        ),
      ),
    );
  }
}
