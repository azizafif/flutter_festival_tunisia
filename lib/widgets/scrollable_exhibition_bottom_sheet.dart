import 'dart:math';

import 'package:flutter/material.dart';

import '../data/cities.dart';
import '../model/city.dart';

class ScrollableExhibitionSheet extends StatefulWidget {
  @override
  _ScrollableExhibitionSheetState createState() =>
      _ScrollableExhibitionSheetState();
}

class _ScrollableExhibitionSheetState extends State<ScrollableExhibitionSheet> {
  double initialPercentage = 0.15;
  City? city;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DraggableScrollableSheet(
        minChildSize: initialPercentage,
        initialChildSize: initialPercentage,
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              double percentage = initialPercentage;
              if (scrollController.hasClients) {
                percentage = (scrollController.position.viewportDimension) /
                    (MediaQuery.of(context).size.height);
              }
              double scaledPercentage =
                  (percentage - initialPercentage) / (1 - initialPercentage);
              return Container(
                padding: const EdgeInsets.only(left: 32),
                decoration: const BoxDecoration(
                  color: Color(0xFF162A49),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: percentage == 1 ? 1 : 0,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(right: 32, top: 128),
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          City city = cities[index % 3];
                          return MyCityItem(
                            city: city,
                            percentageCompleted: percentage,
                          );
                        },
                      ),
                    ),
                    ...cities.map((city) {
                      int index = cities.indexOf(city);
                      int heightPerElement = 120 + 8 + 8;
                      double widthPerElement =
                          40 + percentage * 80 + 8 * (1 - percentage);
                      double leftOffset = widthPerElement *
                          (index > 4 ? index + 2 : index) *
                          (1 - scaledPercentage);
                      return Positioned(
                        top: 44.0 +
                            scaledPercentage * (128 - 44) +
                            index * heightPerElement * scaledPercentage,
                        left: leftOffset,
                        right: 32 - leftOffset,
                        child: IgnorePointer(
                          ignoring: true,
                          child: Opacity(
                            opacity: percentage == 1 ? 0 : 1,
                            child: MyCityItem(
                              city: city,
                              percentageCompleted: percentage,
                            ),
                          ),
                        ),
                      );
                    }),
                    SheetHeader(
                      fontSize: 14 + percentage * 8,
                      topMargin:
                          16 + percentage * MediaQuery.of(context).padding.top,
                    ),
                    MenuButton(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyCityItem extends StatelessWidget {
  final double percentageCompleted;
  final City city;

  const MyCityItem(
      {Key? key, required this.city, required this.percentageCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Transform.scale(
        alignment: Alignment.topLeft,
        scale: 1 / 3 + 2 / 3 * percentageCompleted,
        child: SizedBox(
          height: 120,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: const Radius.circular(16),
                  right: Radius.circular(16 * (1 - percentageCompleted)),
                ),
                child: Image.asset(
                  'assets/${city.assetName}',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: max(0, percentageCompleted * 2 - 1),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(16)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: _buildContent(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Text(city.title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            Text(
              '1 ticket',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              city.desc,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: <Widget>[
            Icon(Icons.place, color: Colors.grey.shade400, size: 16),
            Text(
              'Science Park 10 25A',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
            )
          ],
        )
      ],
    );
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader({Key? key, required this.fontSize, required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 32,
      child: IgnorePointer(
        child: Container(
          padding: EdgeInsets.only(top: topMargin, bottom: 12),
          decoration: const BoxDecoration(
            color: Color(0xFFFB4427),
          ),
          child: Text(
            'Cities and Events',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 12,
      bottom: 24,
      child: Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
