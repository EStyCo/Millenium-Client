import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BattleLogTitle extends StatelessWidget {
  const BattleLogTitle({super.key});

  String getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 120, 211, 253),
            Color.fromARGB(255, 70, 180, 230),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: '${BaseUrl.Get()}/ImageProvider/icons/battle_logs.png',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Боевой журнал',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Colors.white60,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              Text(
                'Дата: ${getCurrentDate()}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Colors.white60,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          //SwitchTimeWidget()
        ],
      ),
    );
  }
}
