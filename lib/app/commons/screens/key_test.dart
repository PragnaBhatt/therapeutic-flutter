import 'package:flutter/material.dart';
import 'dart:math' as math;

class KeyTesting extends StatefulWidget {
  KeyTesting();

  @override
  State<KeyTesting> createState() => _KeyTestingState();


}

class _KeyTestingState extends State<KeyTesting> {
  List<int> list = [1, 2];
  List<Widget> tiles = [
    StatelessColorfulTile(),
    StatelessColorfulTile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      /*Row(
        children: [
        *//* Container(
            //key: UniqueKey(),
            height: 50,
            width: 50,
            color: Colors.orange,
            child: Text(list[0].toString()),
          ),
          Container(
            // key: UniqueKey(),
            height: 50,
            width: 50,
            color: Colors.pink,
            child: Text(list[1].toString()),
          ),*//*


          ElevatedButton(
              onPressed: () {
                int element = list[0];
                list.removeAt(0);
                list.add(element);
                print(list.toString());
                setState(() {});
              },
              child: Text("swap"))
        ],
      ),*/
      /*Let’s understand the composition in Java with the example of books and library. In this example, we create a class Book that contains data members like author, and title and create another class Library that has a reference to refer to the list of books. A library can have no. of books on the same or different subjects. So, If the Library gets destroyed then All books within that particular library will be destroyed. i.e., books can not exist without a library. The relationship between the library and books is composition.*/

      Column(
        children: [
          Row(children: tiles,),
          ElevatedButton(
              onPressed: () {
               /*
               int element = list[0];
                list.removeAt(0);
                list.add(element);
                print(list.toString());
                setState(() {});   */
                setState(() {
                  tiles.insert(1, tiles.removeAt(0));
                });
              },
              child: Text("swap"))
        ],
      )
    );
  }
}
class StatelessColorfulTile extends StatelessWidget {
  // Color myColor = UniqueColorGenerator.getColor();
  Color myColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
  ;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
  }
}