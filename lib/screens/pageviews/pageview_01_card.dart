import 'package:dio_flutter_study/models/card_detail.dart';
import 'package:dio_flutter_study/repositories/card_details_repository.dart';
import 'package:dio_flutter_study/screens/pageviews/pageview_01_detail.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  CardDetailsRepository cardDetailsRepository = CardDetailsRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    cardDetail = await cardDetailsRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: cardDetail == null ? const Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(child: CircularProgressIndicator()),
          ) : InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailPage(
                    cardDetail: cardDetail!,
                  ),
                ),
              );
            },
            child: Hero(
              tag: cardDetail!.id,
              child: Card(
                color: Colors.lightGreen[100],
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                elevation: 8,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            cardDetail!.image,
                            height: 40,
                          ),
                          Text(cardDetail!.title),
                        ],
                      ),
                      const Divider(),
                      Text(cardDetail!.text),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Ler mais",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
