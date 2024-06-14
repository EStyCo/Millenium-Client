import 'package:client/bloc/stats/stats_bloc.dart';
import 'package:client/bloc/stats/stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StatsBloc(),
      child: BlocBuilder<StatsBloc, StatsState>(
        builder: (context, state) {
          return state;
        },
      ),
    );
  }
}

// class _StatsWidgetState extends State<StatsWidget> {
//   late Future<Stats> _statsFuture;
//   late String _name;

//   @override
//   void initState() {
//     super.initState();
//     _name = GetIt.instance<UserStorage>().character.characterName;
//     _statsFuture = _getStats();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Stats>(
//       future: _statsFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (snapshot.hasData) {
//           final stats = snapshot.data!;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Text(
//                     '$_name -  ${stats.level} lvl ${stats.currentEXP}/${stats.toLevelExp} exp'),
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.add),
//                     iconSize: 15,
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.remove),
//                     iconSize: 15,
//                   ),
//                   Text('Strength: ${stats.strength}'),
//                 ],
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.add),
//                     iconSize: 15,
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.remove),
//                     iconSize: 15,
//                   ),
//                   Text('Agility: ${stats.agility}'),
//                 ],
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.add),
//                     iconSize: 15,
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.remove),
//                     iconSize: 15,
//                   ),
//                   Text('Intelligence: ${stats.intelligence}'),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Text('Free Points: ${stats.freePoints}'),
//               ),
//             ],
//           );
//         } else {
//           return Text('No data available');
//         }
//       },
//     );
//   }
// }
