import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_f1/View/Component/text_format.dart';

class TutorialScreen extends StatelessWidget{
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Icon(Icons.close),
            ),
          ),
          TextFormat("Help",
          style: GoogleFonts.roboto(
              fontSize: 24
            ),
          ),
          const TextFormat("This is a little help page if you are having trouble using the website."),
          const TextFormat("In the first screen you have to choose a year and then a race. For continue you have to click the \"Search\" button."),
          const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/homepage.png"),
            height: 400,
            width: 1000
            ),
         const TextFormat("In the second page you can see the laptime chart for the Gran Prix you have selected."),
          TextFormat("How to read the Chart",
          style: GoogleFonts.roboto(
              fontSize: 24
            ),
          ),
          const TextFormat("There two type of chart, one by average lap time and one by driver lap time"),
          const TextFormat("The button above the chart handle the zoom of the chart, you can zoom in, zoom out or reset the zoom if something goes wrong"),
          const TextFormat("For zooming you can only use the previous mentioned button or hold down the left button of the mouse and select a part of the chart to zoom in."),
          const TextFormat("Here an example:"),

          const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/select_zoom.png"),
            height: 400,
            width: 1000
          ),      

          TextFormat("Chart by average lap time",
          style: GoogleFonts.roboto(
              fontSize: 18
            ),
          ),
      
          const TextFormat("This chart take as a reference a average lap time that can be adjusted with the blue slider on top of the chart."),
          const TextFormat("Ex. If the average laptime is set to 1:30.000, the driver who made a 1:30.000 as a average laptime during the race, his chart line will stick near the 0 of the y axis"),
          const TextFormat("If he will do some laptime slower than the average laptime, the chart line will go down, in the minus value of the y axis."),
          const TextFormat("The opposite will happen if he will be quicker."),        
          const TextFormat("If you are interested in only some specific driver, you can deselect the one you are not interest in clicking on his name in the legend tab"),
      
          const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/averagelap_con_zoom.png"),
            height: 400,
            width: 1000
          ),      
          TextFormat("Chart by driver difference",
          style: GoogleFonts.roboto(
              fontSize: 18
            ),
          ),
      
          const TextFormat("This chart take as a reference the lap time of a selected driver, the default one is the winner of the race."),
          const TextFormat("The principle is the same as the average lap time chart, but this time the refence if the laptime of a specific driver."),
          const TextFormat("Ex. If a driver is slower in the first part of the race, the line of the chart will go down, but if he can close the gap and go faster in the second part, the line chart will go up"),
          const TextFormat("The line of the selected driver is always black and always correspond to the 0 value of the y axis"),
          const TextFormat("If you are interested in only some specific driver, you can deselect the one you are not interest in clicking on his name in the legend tab"),
      
          const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/driver_difference_con_zoom.png"),
            height: 400,
            width: 1000
          ),      
          const TextFormat("In the last part of the page there are two column"),
          const TextFormat("One rappresent the race result based on the race selected, and the other one is the championship standing updated at the moment of conclusion of the race selected"),
          const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/result.png"),
            height: 400,
            width: 1000
          ),           
        ]
      ),
    );
  }
  
}