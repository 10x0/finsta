import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          width: 100,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
        actions: [
          SvgPicture.asset(
            'assets/svgs/heart-outline.svg',
            width: 28,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            'assets/svgs/messenger-outline.svg',
            width: 28,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          const SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          currentIndex: _currentIndex,
          onTap: (value) => setState(() {
                _currentIndex = value;
              }),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/svgs/home-bold.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/home-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              activeIcon: SvgPicture.asset(
                'assets/svgs/search-bold.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/search-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Add Post',
              icon: SvgPicture.asset(
                'assets/svgs/add-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/svgs/bag-bold.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/bag-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              activeIcon: CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).textTheme.bodyText2?.color,
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.blue,
                ),
              ),
              icon: const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue,
              ),
            )
          ]),
      body: const Center(child: Text('Home Screen')),
    );
  }
}

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 60, color: Colors.blue);
  }
}
