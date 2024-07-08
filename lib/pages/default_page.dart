import 'dart:ui';

import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:client/bloc/action_screen/action_screen_state.dart';
import 'package:client/pages/Screens/chat/chat_screen.dart';
import 'package:client/pages/Screens/logs/logs_screen.dart';
import 'package:client/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});
  @override
  DefaultPageState createState() => DefaultPageState();
}

class DefaultPageState extends State<DefaultPage> {
  int _selectedIndex = 1;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubicEmphasized);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const LogsScreen(),
          BlocBuilder<ActionScreenBloc, ActionScreenState>(
            builder: (context, state) {
              return state;
            },
          ),
          const ChatScreen()
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 5),
          child: Container(
            color: Colors.white.withOpacity(0.3),
            child: BottomNavigationBar(
              selectedItemColor: Colors.black,
              backgroundColor: Colors.transparent, 
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  label: 'Logs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Action',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
