import 'package:client/models/Utilities/base_url.dart';
import 'package:flutter/material.dart';

class SwitchPlatformWidget extends StatefulWidget {
  const SwitchPlatformWidget({super.key});

  @override
  State<SwitchPlatformWidget> createState() => _SwitchPlatformState();
}

class _SwitchPlatformState extends State<SwitchPlatformWidget> {
  bool isVPS = false;
  String connection = 'local';

  void toggleSwitch(bool value) {
    setState(() {
      if (value) {
        BaseUrl.SwitchToVPS();
        connection = 'VPS';
      } else {
        BaseUrl.SwitchToLocal();
        connection = 'local';
      }
      isVPS = !isVPS;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: isVPS,
          onChanged: toggleSwitch,
          activeColor: Colors.black54,
          activeTrackColor: const Color.fromARGB(255, 153, 213, 241),
        ),
        const Padding(padding: EdgeInsets.only(left: 10)),
        Text(connection)
      ],
    );
  }
}
