//@dart=2.9
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class LockScreen extends StatefulWidget {

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Transform.scale(
                scale: 0.7,
                child: LiteRollingSwitch(
                  value: true,
                  textOn: "On",
                  textOff: "Off",
                  colorOn: Colors.greenAccent,
                  colorOff: Colors.redAccent,
                  iconOn: Icons.lock,
                  iconOff: Icons.lock_open_outlined,
                  textSize: 18.0,
                  onChanged: (bool position) {
                    print("the button is $position");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
