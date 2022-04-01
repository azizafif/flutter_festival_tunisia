import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String name;
  final String desc;
  final double offset;

  const CardContent(
      {Key? key, required this.name, required this.desc, required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              desc,
              style: const TextStyle(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    primary: Colors.white,
                    backgroundColor: const Color(0xFFFB4427),
                  ),
                  child: Transform.translate(
                    offset: Offset(24 * offset, 0),
                    child: const Text('Details'),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
