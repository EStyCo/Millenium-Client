
import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/pages/Screens/action/town_screen.dart';
import 'package:client/models/Place/details_monster.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/widgets/details/details_rewards_widget.dart';
import 'package:client/widgets/details/details_states_widget.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class DetailsMonsterState extends StatelessWidget {
  const DetailsMonsterState({super.key});
}

class LoadingDetailsState extends DetailsMonsterState {
  LoadingDetailsState({super.key});
  final storage = GetIt.I<UserStorage>();

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Загрузка'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}

class LoadedDetailsState extends DetailsMonsterState {
  const LoadedDetailsState({super.key, required this.details});
  final DetailsMonster details;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Center(
        child: Text(details.name),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Align(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${BaseUrl.Get()}/imageProvider/${details.imagePath}',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          const MyDivider(),
          Center(
            child: Text(
              details.description,
              textAlign: TextAlign.center,
            ),
          ),
          const MyDivider(),
          Text('Здоровье: ${details.hp}'),
          Text('Опыт за убийство: ${details.exp}'),
          Text(
              'Скорость атаки: ${details.minTTimeAttack}-${details.maxTTimeAttack}с.'),
          Text('Сила: ${details.strength}'),
          Text('Ловкость: ${details.agility}'),
          Text('Интеллект: ${details.intelligence}'),
          DetailsStatesWidget(details: details),
          const MyDivider(),
          DetailsRewardsWidget(items: details.rewards)
        ],
      ),
    );
  }
}

class DeniedLoadedDetailsState extends DetailsMonsterState {
  const DeniedLoadedDetailsState({super.key});
  @override
  Widget build(BuildContext context) {
    return const TownScreen();
  }
}
