import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/mentor_list_handler.dart';
import 'package:client/widgets/mentor_return_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MentorScreen extends ConsumerWidget {
  MentorScreen({super.key});

  final mentorList = MentorListHandler();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref
        .watch(ChangeNotifierProvider<MentorListHandler>((ref) => mentorList));

    if (provider.spellList.isEmpty) {
      return Column(
        children: [
          MentorReturnWidget(
            freePoints: provider.freePoints,
            totalPoints: provider.totalPoints,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          MentorReturnWidget(
            freePoints: provider.freePoints,
            totalPoints: provider.totalPoints,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.spellList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            '${BaseUrl.Get()}/imageProvider/${provider.spellList[index].imagePath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(provider.spellList[index].name),
                  subtitle: Text(
                    '${provider.spellList[index].description}\nПерезарядка - [${provider.spellList[index].coolDown}] сек.',
                    style: const TextStyle(fontSize: 13),
                  ),
                  trailing: ElevatedButton(
                    onPressed: provider.spellList[index].isLearning
                        ? () {
                            provider.forgotSpell(
                                provider.spellList[index].spellType);
                          }
                        : () {
                            provider.learnSpell(
                                provider.spellList[index].spellType);
                          },
                    child: provider.spellList[index].isLearning
                        ? const Text('Забыть')
                        : const Text('Выучить'),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
