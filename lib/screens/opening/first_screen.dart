import 'package:flutter/material.dart';
import 'package:space/reused/app_color.dart';
import 'package:space/reused/planets_image.dart';
import 'package:space/screens/second_screen/UI/second_screen.dart';

import '../../reused/app_font.dart';

class firstScreen extends StatelessWidget {
  const firstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Image.asset(
              app_planets_image.first_screen_planet,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Explore\nThe\nUniverse",
                style: app_fontStyle.first_page_text,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const mainScreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Explore",style: app_fontStyle.button_text,),
                          Icon(Icons.arrow_forward,color: app_color.white,size: 25,)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity(vertical: 3),
                        backgroundColor: app_color.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
