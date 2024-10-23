import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Place/details_monster.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class DetailsStatesWidget extends StatelessWidget {
   const DetailsStatesWidget({super.key, required this.details});

   final DetailsMonster details; 

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const MyDivider(),
      const Center(
        child: Text(
          'Состояния',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 10),
      for (var item in details.states)
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          '${BaseUrl.Get()}/imageProvider/${item.imagePath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.description,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
            const MyDivider(),
          ],
        ),
    ]);
  }
}
