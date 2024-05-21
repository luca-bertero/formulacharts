import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_f1/Dto/Utils/RaceInfo.dart';
import 'package:web_f1/Provider/LapChartProvider.dart';
import 'package:web_f1/View/Component/help_floating_button.dart';
import 'package:web_f1/View/average_laptime_chart.dart';
import 'package:web_f1/View/championship_standing.dart';
import 'package:web_f1/View/driver_dfference_laptime_chart.dart';
import 'package:web_f1/View/race_result_view.dart';

class LaptimeChart extends ConsumerStatefulWidget {
  final int year;
  final int raceNumber;
  const LaptimeChart({super.key, required this.year, required this.raceNumber});

  @override
  ConsumerState<LaptimeChart> createState() => _LaptimeChartState();
}

class _LaptimeChartState extends ConsumerState<LaptimeChart> with TickerProviderStateMixin  {
  int indexBar = 0;
  final AnchorScrollController _scrollController = AnchorScrollController();

bool _isMediumScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 650.0;
}
  @override
  Widget build(BuildContext context) {

  final TabController tabBarTheme = TabController(vsync: this, length: 2);
  final AsyncValue<String> roundName = ref.watch(raceNameProviderLap(RaceInfo(year: widget.year, race: widget.raceNumber)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formula Charts'),
      ),
      body: _isMediumScreen(context) 
        ? largeScreenWidget(roundName, tabBarTheme) : smallScreenWidget(roundName, tabBarTheme),
      floatingActionButton: getHelpFloatingActionButton(context),
      bottomNavigationBar: _isMediumScreen(context) ? null :  
      BottomNavigationBar(
        useLegacyColorScheme: false,
        items: const [ 
          BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label:"Chart"),
          BottomNavigationBarItem(icon: Icon(Icons.flag,), label: "Race\nResults"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "Championship\nStanding"),
        ],
        currentIndex: indexBar,
        onTap: (i){
          if(i == 0) context.goNamed("home");
          setState(() {
            indexBar = i;
            _scrollController.scrollToIndex(index: i);
          });
        },
      ),
    );
  }

  Widget largeScreenWidget(AsyncValue<String> roundName, TabController tabBarTheme){
    return Row(
      children: [
        NavigationRail(
          selectedIndex: indexBar,
          labelType: NavigationRailLabelType.all,
          onDestinationSelected: (i){
            setState(() {
              indexBar = i;
              _scrollController.scrollToIndex(index: i);
            });
          },
          destinations: const
            [
              NavigationRailDestination(icon: Icon(Icons.timeline), label: Text("Chart")),
              NavigationRailDestination(icon: Icon(Icons.flag,), label: Text("Race\nResults")),
              NavigationRailDestination(icon: Icon(Icons.emoji_events), label: Text("Championship\nStanding")),
            ],
          leading: IconButton(
            onPressed: () => context.goNamed("home"),
            icon: const Icon(Icons.home),
          ),
        ),
        Expanded(
          child: ListView(
            controller: _scrollController,
            children: [
              roundName.isLoading ? 
              const LinearProgressIndicator() :
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  roundName.value ?? "Race", 
                  style: GoogleFonts.roboto(fontSize: 38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnchorItemWrapper(
                  index: 0,
                  controller: _scrollController,
                  child: TabBar(
                    labelColor: Colors.black,
                    controller: tabBarTheme,
                    tabs: const [
                      Tab(text: 'Average LapTime'),
                      Tab(text: 'By driver difference'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnchorItemWrapper(
                  index: 1,
                  controller: _scrollController,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: TabBarView(
                      controller: tabBarTheme,
                      children: [
                        AverageLaptimeChart(year: widget.year, raceNumber: widget.raceNumber),
                        DriverDifferenceLaptimeChart(year: widget.year, raceNumber: widget.raceNumber),
                      ]
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AnchorItemWrapper(
                      index: 2,
                      controller: _scrollController,
                      child: SizedBox( 
                        height: MediaQuery.of(context).size.height * 1.3,
                        //width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            Text(
                              "Race Results",
                              style: GoogleFonts.roboto(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(child: RaceResultView(year: widget.year, raceNumber: widget.raceNumber)),
                          ],
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnchorItemWrapper(
                      index: 3,
                      controller: _scrollController,
                      child: SizedBox(                        
                        height: MediaQuery.of(context).size.height * 1.3,
                        //width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            Text(
                              "Championship Standing",
                              style: GoogleFonts.roboto(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(child: ChampionshipStanding(year: widget.year, round: widget.raceNumber)),
                          ],
                        )
                      ),
                    ),
                  )
                ]
              )
            ],  
          ),
        ),
      ]
    );
  }

  Widget smallScreenWidget(AsyncValue<String> roundName, TabController tabBarTheme){
    return Row(
      children: [
        Expanded(
          child: ListView(
            controller: _scrollController,
            children: [
              roundName.isLoading ? 
              const LinearProgressIndicator() :
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnchorItemWrapper(
                  index: 0,
                  controller: _scrollController,
                  child: Text(
                    roundName.value ?? "Race", 
                    style: GoogleFonts.roboto(
                      fontSize: 38
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  labelColor: Colors.black,
                  controller: tabBarTheme,
                  tabs: const [
                    Tab(text: 'Average LapTime'),
                    Tab(text: 'By driver difference'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TabBarView(
                    controller: tabBarTheme,
                    children: [
                      AverageLaptimeChart(year: widget.year, raceNumber: widget.raceNumber),
                      DriverDifferenceLaptimeChart(year: widget.year, raceNumber: widget.raceNumber),
                    ]
                  ),
                ),
              ),
              Column(
                children: [
                  AnchorItemWrapper(
                    index: 1,
                    controller: _scrollController,
                    child: SizedBox( 
                      height: MediaQuery.of(context).size.height * 1.3,
                      //width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Race Results",
                              style: GoogleFonts.roboto(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(child: RaceResultView(year: widget.year, raceNumber: widget.raceNumber)),
                        ],
                      )
                    ),
                  ),
                  AnchorItemWrapper(
                    index: 2,
                    controller: _scrollController,
                    child: SizedBox(                        
                      height: MediaQuery.of(context).size.height * 1.3,
                      //width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Championship Standing",
                              style: GoogleFonts.roboto(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(child: ChampionshipStanding(year: widget.year, round: widget.raceNumber)),
                        ],
                      )
                    ),
                  )
                ]
              )
            ],  
          ),
        ),
      ]
    ); 
  }
}