import 'package:dio_flutter_study/models/card_detail.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;

  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close_rounded)),
              Row(
                children: [
                  Image.asset(
                    cardDetail.image,
                    height: 120,
                  ),
                  Text(cardDetail.title),
                ],
              ),
              const Divider(),
              Expanded(child: Text(cardDetail.text)),
            ],
          ),
        ),
      ),
    );
  }
}
