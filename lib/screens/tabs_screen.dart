import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../size_config.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;
  final _uncompletedTodos = [
    Todo(
      id: '1',
      title: 'Learning Flutter',
      detail: 'Always Learning',
      date: DateTime.now(),
    ),
    Todo(
      id: '2',
      title: 'Learning JavaScript',
      detail: 'Always Learning',
      date: DateTime.now(),
    ),
    Todo(
      id: '3',
      title: 'Learning Python',
      detail: 'Always Learning',
      date: DateTime.now(),
    ),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget activeScreen = const Center(
      child: Text('Screen 1'),
    );

    if (_selectedPageIndex == 1) {
      activeScreen = const Center(
        child: Text('Screen 2'),
      );
    }

    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Uncompleted Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done_all_outlined,
            ),
            label: 'Uncompleted Task',
          ),
        ],
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
