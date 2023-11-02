// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nssystem/screens/chief_nurse/cn.requirement.screen.dart';
import 'package:nssystem/screens/chief_nurse/cn.request.screen.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/custom.tab.dart';

class HorarioScreen extends StatefulWidget {
  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen>
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
                    text: 'Requerimientos',
                    isSelected: _controller.index == 0)),
            Tab(
                child: CustomTab(
                    text: 'Solicitudes', isSelected: _controller.index == 1)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          // Aquí iría el contenido de la pestaña 'Requerimientos'
          RequirementTab(),
          // Aquí iría el contenido de la pestaña 'Solicitudes'
          RequestTab(),
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
