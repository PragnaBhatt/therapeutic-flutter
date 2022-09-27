import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return


      TabBar(
        labelColor: Colors.deepOrange,
        unselectedLabelColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
        tabs: [
          Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, size: 20),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Home'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.note_alt_sharp, size: 20),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Notes'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 20),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Favourite'),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, size: 20),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Profile'),
                ],
              )),
        ],
        isScrollable: false,
        automaticIndicatorColorAdjustment: true,
        indicatorColor: Colors.orange);
  }
}