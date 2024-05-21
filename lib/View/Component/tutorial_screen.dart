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
          const TextFormat("This is a helpful page if you are having trouble using the website."),
          const TextFormat("On the first screen, you must select a year and then choose a race. To continue, click the 'Search' button."),
          const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/homepage.png"),
            height: 400,
            width: 1000
            ),
         const TextFormat("On the second page, you can see the lap time chart for the Grand Prix you have selected."),
          TextFormat("How to read the Chart",
          style: GoogleFonts.roboto(
              fontSize: 24
            ),
          ),
          const TextFormat("There are two types of charts: one for average lap time and one for driver lap time."),
          const TextFormat("The buttons above the chart control the zoom; you can zoom in, zoom out, or reset the zoom if something goes wrong."),
          const TextFormat("To zoom, you can use only the previously mentioned buttons or hold down the left mouse button and select a part of the chart to zoom in."),
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
      
          const TextFormat("This chart uses an average lap time as a reference, which can be adjusted using the blue slider at the top of the chart."),
          const TextFormat("For example, if the average lap time is set to 1:30.000, the driver whose average lap time during the race matches this will have his chart line hover near the 0 on the y-axis"),
          const TextFormat(" If he records lap times slower than the average, the chart line will dip into negative values on the y-axis"),
          const TextFormat("Conversely, if he is quicker, the line will rise above 0"),        
          const TextFormat(" If you are interested in only specific drivers, you can deselect the ones you are not interested in by clicking on their names in the legend tab."),
      
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
      
          const TextFormat("This chart references the lap time of a selected driver, with the default being the race winner."),
          const TextFormat("The principle is similar to the average lap time chart, but this time the reference is the lap time of a specific driver."),
          const TextFormat("For example, if a driver is slower in the first part of the race, the chart line will go down, but if he can close the gap and speed up in the second part, the line will rise."),
          const TextFormat("The line of the selected driver is always black and corresponds to the 0 value on the y-axis."),
          const TextFormat("If you are interested in only specific drivers, you can deselect the ones you are not interested in by clicking on their names in the legend tab."),
      
          const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/driver_difference_con_zoom.png"),
            height: 400,
            width: 1000
          ),      
          const TextFormat("In the last part of the page, there are two columns."),
          const TextFormat("One represents the race results based on the selected race, and the other displays the championship standings updated at the moment the selected race concluded."),
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