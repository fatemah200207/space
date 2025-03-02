import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space/reused/app_color.dart';
import 'package:space/reused/app_font.dart';
import 'package:space/screens/second_screen/UI/second_screen.dart';
import '../../reused/planets_image.dart';
import '../second_screen/Data/planet.dart';

class PlanetDetailsScreen extends StatefulWidget {
  final Planet planet;
  const PlanetDetailsScreen({super.key, required this.planet});

  @override
  State<PlanetDetailsScreen> createState() => _PlanetDetailsScreenState();
}

class _PlanetDetailsScreenState extends State<PlanetDetailsScreen> {
  Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(215),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SizedBox.expand(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage(app_planets_image.appBarImage),
                      fit: BoxFit.cover,
                      ),
                    ), 
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.planet.descriptionTitle,style: app_fontStyle.title,),
                    )
                )
              ],
            ),
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                    backgroundColor: app_color.red,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                        color: app_color.white,
                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => mainScreen(),
                            ));

                      },

                    )
                ),
              ),
              SizedBox(width: 90,),
              Center(
                child: Text(widget.planet.planet_name,style: app_fontStyle.title,),
              ),
            ],
          ),

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 300,
                width: 300,
                child: Flutter3DViewer(
                  controller: controller,
                  src: widget.planet.glb_image, // Ensure this is correctly set
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("About",style: app_fontStyle.title,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.planet.about,style: app_fontStyle.body,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Distance from Sun (km):",style: app_fontStyle.bodyQ,),
                  Text(widget.planet.distanceFromSun,style: app_fontStyle.bodyTwo,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Length of Day (hours):",style: app_fontStyle.bodyQ,),
                  Text(widget.planet.dayLength,style: app_fontStyle.bodyTwo,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Orbital Period (Earth years):",style: app_fontStyle.bodyQ,),
                  Text(widget.planet.orbitalPeriod,style: app_fontStyle.bodyTwo,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Radius (km):",style: app_fontStyle.bodyQ,),
                  Text(widget.planet.radius,style: app_fontStyle.bodyTwo,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Mass (kg):",style: app_fontStyle.bodyQ,),
                  Text(widget.planet.mass,style: app_fontStyle.bodyTwo,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Gravity (m/s²):",style: app_fontStyle.bodyQ,),
                  Text(widget.planet.gravity,style: app_fontStyle.bodyTwo,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Surface Area (km²):",style: app_fontStyle.bodyQ,),
                  Text(widget.planet.surfaceArea,style: app_fontStyle.bodyTwo,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

