import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/models/item.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class DetailsRewardsWidget extends StatelessWidget {
  const DetailsRewardsWidget({super.key, required this.items});

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Добыча',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: List.generate(
            items.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0 : 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black12,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${BaseUrl.Get()}/imageProvider/${items[index].imagePath}',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              items[index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            items[index].description,
                            style: const TextStyle(fontSize: 12),
                            softWrap: true,
                          ),
                          const SizedBox(height: 3),
                          if (items[index].damage != null)
                            Text(
                              'Урон: ${items[index].damage}',
                              style: const TextStyle(fontSize: 13),
                              softWrap: true,
                            ),
                          Text(
                            items[index].gainsDescription,
                            style: const TextStyle(fontSize: 13),
                            softWrap: true,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const MyDivider(),
      ],
    );
  }
}
