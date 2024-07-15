import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/buff_bar_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class BuffBarWidget extends ConsumerWidget {
  BuffBarWidget({super.key});
  final handler = GetIt.I<BuffBarHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      ChangeNotifierProvider<BuffBarHandler>(
        (ref) => handler,
      ),
    );
    return SizedBox(
      child: Row(
        children: List.generate(
          provider.stateslist.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Stack(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          '${BaseUrl.Get()}/imageProvider/${provider.stateslist[index].imagePath}',
                      // Image.asset(
                      //   'assets/images/spells/${provider.stateslist[index].imagePath}',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '${provider.stateslist[index].time}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
