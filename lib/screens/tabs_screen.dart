import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/completed_task.dart';
import '../screens/uncompleted_task.dart';
import '../providers/navbar_provider.dart';
import '../size_config.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  final _pageController = PageController();
  

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var selectedPageIndex = ref.watch(navbarProvider);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          UncompletedTodoScreen(),
          CompletedTodoScreen(),
        ],
      ),
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
        onTap: (index) {
          ref.read(navbarProvider.notifier).selectPage(index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
