import 'package:flutter/material.dart';

import '../data/cities.dart';
import 'sliding_card.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: cities[0].title,
            desc: cities[0].desc,
            assetName: cities[0].assetName,
            offset: pageOffset,
          ),
          SlidingCard(
            name: cities[1].title,
            desc: cities[1].desc,
            assetName: cities[1].assetName,
            offset: pageOffset,
          ),
          SlidingCard(
            name: cities[2].title,
            desc: cities[2].desc,
            assetName: cities[2].assetName,
            offset: pageOffset - 2,
          ),
        ],
      ),
    );
  }
}
