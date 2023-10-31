import 'package:flutter/material.dart';
import 'package:nssystem/model/request.card.model.dart';
import 'package:nssystem/model/request.model.dart';
import 'package:nssystem/screens/chief_nurse/cn.request.detail.screen.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/shift.card.dart';
import 'package:get/get.dart';

class RequestCard extends StatelessWidget {
  final RequestCardModel requestCard;
  final RequestModel requestDetail;

  RequestCard({required this.requestCard, required this.requestDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          RequestDetailsScreen(request: requestDetail),
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          barrierColor: Colors.black.withOpacity(0.5), // background color
          enableDrag: true,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        color: GlobalColors.secondaryColor,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: GlobalColors.mainColor,
            child: const Icon(
              Icons.alarm,
              color: Colors.white,
            ),
          ),
          title: Text(
            '${requestCard.name} ${requestCard.lastName}',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: GlobalColors.textColor),
          ),
          subtitle: Text(
            'Pendiente revisión',
            style: TextStyle(color: GlobalColors.textColor2, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
