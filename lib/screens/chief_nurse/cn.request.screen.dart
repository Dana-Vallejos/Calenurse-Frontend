import 'package:flutter/material.dart';
import 'package:nssystem/model/request.card.model.dart';
import 'package:nssystem/model/request.model.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/request.card.dart';

class RequestTab extends StatelessWidget {
  RequestTab({Key? key}) : super(key: key);

  final List<RequestCardModel> requestCards = RequestCardModel.requestCards;
  final List<RequestModel> detailedRequests = RequestModel.detailedRequests;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cambios de horario',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: GlobalColors.textColor),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: requestCards.length,
              itemBuilder: (context, index) {
                return RequestCard(
                  requestCard: requestCards[index],
                  requestDetail: detailedRequests[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
