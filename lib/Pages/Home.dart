import 'package:flutter/material.dart';

import '../Utility/CustomTheme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool buttonState = false;

  @override
  Widget build(BuildContext context) {
    CustomTheme OBJ = CustomTheme.fromContext(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: OBJ.aspectratio * 50),
            Text(
              "Harpy",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: OBJ.aspectratio * 45,
                  color: const Color.fromARGB(255, 41, 26, 62)),
            ),
            Icon(
              Icons.more_vert_outlined,
              size: OBJ.aspectratio * 50,
            ),
          ],
        ),
        SizedBox(
          height: OBJ.height * 0.02,
        ),
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          // transitionBuilder: (Widget child, Animation<double> animation) {
          //   const begin = Offset(0.0, 1.0);
          //   const end = Offset.zero;
          //   var offsetAnimation =
          //       Tween(begin: begin, end: end).animate(animation);
          //   return SlideTransition(
          //     position: offsetAnimation,
          //     child: child,
          //   );
          // },
          child: FadeTransition(
            opacity: AlwaysStoppedAnimation(1.0),
            key: ValueKey<bool>(buttonState),
            child: !buttonState
                ? Image.asset(
                    "assets/images/drone.png",
                    key: ValueKey<bool>(buttonState),
                  )
                : Image.asset(
                    "assets/images/thiruvaluvar.png",
                    height: OBJ.height*0.38,
                    fit: BoxFit.cover,
                    key: ValueKey<bool>(buttonState),
                  ),
          ),
        ),
        Spacer(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PropertyHelper(description: "Range", value: "150m"),
            PropertyHelper(description: "battery", value: "90%"),
            PropertyHelper(
              description: "temperature",
              value: "41°",
            ),
          ],
        ),
        SizedBox(
          height: OBJ.height * 0.03,
        ),
        Image.asset("assets/images/Location.png"),
        SizedBox(
          height: OBJ.height * 0.02,
        ),
        GestureDetector(
          onTap: () => setState(() {
            buttonState = !buttonState;
          }),
          child: AnimatedContainer(
            width: OBJ.width,
            margin: EdgeInsets.symmetric(horizontal: OBJ.width * 0.1),
            padding: EdgeInsets.symmetric(vertical: OBJ.height * 0.01),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.red),
            duration: const Duration(seconds: 1),
            child: Center(
                child: Text(
              (buttonState ? "launching..." : "launch").toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: OBJ.aspectratio * 45,
                  shadows: const [
                    BoxShadow(color: Colors.black, spreadRadius: 12)
                  ]),
            )),
          ),
        ),
        SizedBox(
          height: OBJ.height * 0.03,
        ),
      ],
    );
  }
}

class PropertyHelper extends StatelessWidget {
  final String value;
  final String description;
  const PropertyHelper({
    super.key,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme OBJ = CustomTheme.fromContext(context);
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: OBJ.aspectratio * 40),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            description.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: OBJ.aspectratio * 28,
                color: Color.fromARGB(147, 82, 68, 109)),
          ),
        ],
      ),
    );
  }
}
