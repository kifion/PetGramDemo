import 'package:flutter/material.dart';
import 'package:petgram/localization/app_localization.dart';
import 'package:petgram/presentation/home/home_screen.dart';
import 'package:petgram/presentation/settings/settings_screen.dart';

import '../detail/detail_screen.dart';
import 'widget_settings_button.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedScreenList = 0;
  List<Widget> screenList = <Widget>[];

  @override
  void initState() {
    screenList.add(HomeScreen());
    screenList.add(SettingsScreen());
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreenList = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
        actions: [
          SettingsButtonWidget()
        ],
      ),
      body: IndexedStack(
        index: _selectedScreenList,
        children: screenList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedScreenList,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(),
      ),
    );
  }
}
