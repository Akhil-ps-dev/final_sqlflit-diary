//@dart=2.9
import 'package:flutter/material.dart';

List<Color> colors = [
  Color(0xFFFFFFFF),
  Color(0xffF28B83),
  Color(0xFFFCBC05),
  Color(0xFFFFF476),
  Color(0xFFCBFF90),
  Color(0xFFA7FEEA),
  Color(0xFFE6C9A9),
  Color(0xFFE8EAEE),
  Color(0xFFA7FEEA),
  Color(0xFFCAF0F8)
];

class PriorityPicker extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  PriorityPicker({this.onTap, this.selectedIndex});
  @override
  _PriorityPickerState createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {
  int selectedIndex;
  List<String> priorityText = [
    'Happy',
    'Sad',
    'Bored',
    'Fear',
    'Surprice',
    'Anger'
  ];
  List<Color> priorityColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    if (selectedIndex == null) {
      selectedIndex = widget.selectedIndex;
    }
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: width / 3,
                height: 70,
                child: Container(
                  child: Center(
                    child: Text(priorityText[index],
                        style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? priorityColor[index]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                      border: selectedIndex == index
                          ? Border.all(width: 2, color: Colors.black)
                          : Border.all(width: 0, color: Colors.black)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class ColorPicker extends StatefulWidget {
//   final Function(int) onTap;
//   final int selectedIndex;
//   ColorPicker({this.onTap, this.selectedIndex});
//   @override
//   _ColorPickerState createState() => _ColorPickerState();
// }

// class _ColorPickerState extends State<ColorPicker> {
//   int selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     if (selectedIndex == null) {
//       selectedIndex = widget.selectedIndex;
//     }
//     double width = MediaQuery.of(context).size.width;
//     return SizedBox(
//       width: width,
//       height: 50,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: colors.length,
//         itemBuilder: (BuildContext context, int index) {
//           return InkWell(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//               widget.onTap(index);
//             },
//             child: Container(
//               padding: EdgeInsets.all(8.0),
//               width: 50,
//               height: 50,
//               child: Container(
//                 child: Center(
//                     child: selectedIndex == index
//                         ? Icon(Icons.done)
//                         : Container()),
//                 decoration: BoxDecoration(
//                     color: colors[index],
//                     shape: BoxShape.circle,
//                     border: Border.all(width: 2, color: Colors.black)),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
