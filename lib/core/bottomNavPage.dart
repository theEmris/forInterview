import 'package:flutter/material.dart';
import 'package:interview_app/screens/firstpage.dart';
import 'package:interview_app/screens/secondScreen.dart';

class BottomNAvBar extends StatefulWidget {
  const BottomNAvBar({Key? key}) : super(key: key);

  @override
  State<BottomNAvBar> createState() => _BottomNAvBarState();
}

class _BottomNAvBarState extends State<BottomNAvBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    SavedModel()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.save_rounded),
            label: 'Saved',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}