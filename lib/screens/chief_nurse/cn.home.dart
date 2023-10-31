import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nssystem/screens/chief_nurse/cn.homepage.screen.dart';
import 'package:nssystem/screens/chief_nurse/cn.notification.screen.dart';
import 'package:nssystem/screens/chief_nurse/cn.profile.screen.dart';
import 'package:nssystem/screens/chief_nurse/cn.schedule.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomepageCN(),
    HorarioScreen(),
    NotificacionesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_currentindex)),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              backgroundColor: Colors.white,
              color: const Color(0xFF8696BB),
              gap: 5,
              activeColor: const Color(0xFF63B4FF),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabBackgroundColor: const Color(0xFFE5F5FF),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Inicio',
                ),
                GButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Horario',
                ),
                GButton(
                  icon: Icons.notifications_none_outlined,
                  text: 'Notificaciones',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Perfil',
                )
              ],
              selectedIndex: _currentindex,
              onTabChange: (index) {
                setState(() {
                  _currentindex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
