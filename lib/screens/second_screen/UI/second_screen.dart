import 'package:flutter/material.dart';
import 'package:space/reused/app_color.dart';
import 'package:space/reused/app_font.dart';
import 'package:space/reused/planets_image.dart';
import 'package:space/screens/detailed_screen/detailed_planet.dart';
import 'package:space/screens/second_screen/Data/planet.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  final PageController _pageController = PageController(); // Controller for PageView
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  void nextPlanet() {
    if (currentIndex < planets.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPlanet() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(215),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Explore",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          flexibleSpace: SizedBox.expand(
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image(
                      image: AssetImage(app_planets_image.appBarImage,),
                      fit: BoxFit.cover,)
                ),
                Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ]
                        )
                      ),)
                )
              ],

            ),

          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(220),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Which planet\nwould you like to explore?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),
                ),
              )),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: planets.length,
                  onPageChanged: onPageChanged, // Update index when swiped
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(planets[index].image, height: 300),
                        const SizedBox(height: 20),

                      ],
                    );
                  })
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (currentIndex > 0)?
                  CircleAvatar(
                    backgroundColor: app_color.red,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: previousPlanet,
                    ),
                  )
                : const SizedBox(width: 40),

                Text(
                  planets[currentIndex].planet_name,
                  style: app_fontStyle.title,
                ),

                (currentIndex < planets.length - 1)?
                  CircleAvatar(
                    backgroundColor: app_color.red,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: nextPlanet,
                    ),
                  )
                : const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlanetDetailsScreen(planet: planets[currentIndex]),
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Explore ${planets[currentIndex].planet_name} ",style: app_fontStyle.button_text,),
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
          ),
        ],
      ),
    );
  }
}
