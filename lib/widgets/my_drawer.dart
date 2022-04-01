import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: Material(
        color: const Color(0xFF333C83),
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/flag.png',
                        ),
                        radius: 40,
                      ),
                      SizedBox(width: 21),
                      Text(
                        'Flutter Festival\nTunisia',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.new_releases),
                  title: Text('News'),
                ),
                const ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Favorites'),
                ),
                const ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
