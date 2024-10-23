import 'package:client/models/Utilities/base_url.dart';
import 'package:flutter/material.dart';

class SwitchTimeWidget extends StatefulWidget {
  const SwitchTimeWidget({super.key});

  @override
  State<SwitchTimeWidget> createState() => _SwitchTimeState();
}

class _SwitchTimeState extends State<SwitchTimeWidget> {
  bool isCurrentTimeZome = true;
  String connection = '';

  void toggleSwitch(bool value) async {
    // tzd.initializeTimeZones();
    // tz.Location moscow = tz.getLocation('Europe/Moscow');
    // tz.TZDateTime nowInMoscow = tz.TZDateTime.now(moscow);

    setState(() {
      if (value) {
        BaseUrl.SwitchToVPS();
        connection = '';
      } else {
        BaseUrl.switchToLocal();
        connection = 'МСК';
      }
      isCurrentTimeZome = !isCurrentTimeZome;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Switch(
          value: isCurrentTimeZome,
          onChanged: toggleSwitch,
          activeColor: Colors.black54,
          activeTrackColor: const Color.fromARGB(255, 153, 213, 241),
        ),
        const Padding(padding: EdgeInsets.only(left: 10)),
        Text(connection),
        //TextButton(onPressed: null, child: Text('!'))

      ],
    );
  }
}
