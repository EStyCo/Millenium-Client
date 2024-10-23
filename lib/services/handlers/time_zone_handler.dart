import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzd;

class TimeZoneHandler {
  static String currentTimeZone = '';

  static void loadTimeZone() async {
    final prefs = await SharedPreferences.getInstance();
    currentTimeZone = prefs.getString('time_zone') ?? '';
  }

  void _setCurrentTimeZone() async {
    final prefs = await SharedPreferences.getInstance();
    final difference = _compareTimeZonesWithMoscow();
    await prefs.setString('time_zone', difference.toString());
  }

  Future<int> _compareTimeZonesWithMoscow() async {
    tzd.initializeTimeZones();
    tz.Location moscow = tz.getLocation('Europe/Moscow');
    tz.TZDateTime nowInMoscow = tz.TZDateTime.now(moscow);

    return 5;
  }
}
