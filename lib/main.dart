import 'package:flutter/material.dart';
import 'package:kot_pes/infoList.dart';
import 'package:kot_pes/lentaList.dart';
import 'package:kot_pes/searchList.dart';

void main() {
  runApp(Kotipes());
}

class Kotipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber[600],
        accentColor: Color(0xFF8F6400),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.grey[700],
      ),
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _tappedIndex = 0;
  final tabs = [
    Lenta(),
    Search(),
    Info(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _tappedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: tabs[_tappedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.white,
        currentIndex: _tappedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Лента'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Приют'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Информация'),
          ),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}
