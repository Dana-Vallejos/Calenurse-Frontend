import 'package:flutter/material.dart';

import 'package:nssystem/screens/nurse/n.addShift.screen.dart';
import 'package:nssystem/screens/nurse/n.changeschedule.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/custom.tab.dart';


class ScheduleNursePage extends StatefulWidget {
  const ScheduleNursePage({Key? key}) : super(key: key);

  @override
  State<ScheduleNursePage> createState() => _ScheduleNursePageState();

}

class _ScheduleNursePageState extends State<ScheduleNursePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Horario',
            style: TextStyle(color: GlobalColors.textColor),
          ),
        ),
        bottom: TabBar(
          controller: _controller,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: GlobalColors.selectedColor,
          ),
          labelColor: GlobalColors.textColor,
          unselectedLabelColor: GlobalColors.textColor2,
          tabs: [
            Tab(
                child: CustomTab(
                    text: 'Eligir horario',
                    isSelected: _controller.index == 0)),
            Tab(
                child: CustomTab(
                    text: 'Cambiar horario', isSelected: _controller.index == 1)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          AddPreference(),
          ChangeScheduleNurse()

        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
