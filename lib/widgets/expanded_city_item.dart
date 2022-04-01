import 'package:flutter/material.dart';

class ExpandedCityItem extends StatelessWidget {
  final double? topMargin;
  final double? leftMargin;
  final double? height;
  final bool? isVisible;
  final double? borderRadius;
  final String? title;
  final String? desc;

  const ExpandedCityItem(
      {Key? key,
      this.topMargin,
      this.height,
      this.isVisible,
      this.borderRadius,
      this.title,
      this.desc,
      this.leftMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible! ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: height!).add(const EdgeInsets.all(8)),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Text(title!, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            desc!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
