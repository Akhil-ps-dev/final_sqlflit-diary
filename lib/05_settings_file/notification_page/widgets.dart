import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePageButtons extends StatelessWidget {
  final Future<void> Function() onPressedOne;
  final Future<void> Function() onPressedTwo;
  final Future<void> Function() onPressedThree;
  const HomePageButtons({
    Key? key,
    required this.onPressedOne,
    required this.onPressedTwo,
    required this.onPressedThree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal[600],
                ),
              ),
              onPressed: onPressedOne,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.dollarSign,
                    size: 14,
                    color: Colors.teal[50],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Plant Food',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal[600],
                ),
              ),
              onPressed: onPressedTwo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.tint,
                    size: 14,
                    color: Colors.teal[50],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Water',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal[600],
                ),
              ),
              onPressed: onPressedThree,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidTimesCircle,
                    size: 14,
                    color: Colors.teal[50],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

