import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ticket_app/notifiers/nav_bar_notifier.dart';
import 'package:ticket_app/widgets/app_bar.dart';
import 'package:ticket_app/widgets/grid_builder.dart';
import '../notifiers/chart_option_notifier.dart';

/// Main home screen of the ticket app
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 110,
          title: Text(
            'Home',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 0.1,
                ),
          ),
          action: IconButton(
            iconSize: 25,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active_outlined,
            ),
          ),
        ),
        drawer: const Drawer(
          child: Center(child: Text('My Ticket App')),
        ),
        body: Consumer<ChartOptionNotifier>(
          builder: (context, chartOptionNotifier, child) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: TabBar(
                    padding: const EdgeInsets.only(left: 0),
                    indicatorWeight: 3.0,
                    unselectedLabelColor: Colors.grey.shade700,
                    indicatorColor: Colors.red,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), // Creates border
                      color: Colors.blueGrey,
                    ),
                    tabs: const [
                      Tab(
                        icon: Text('Day'),
                      ),
                      Tab(
                        icon: Text('Week'),
                      ),
                      Tab(
                        icon: Text('Month'),
                      ),
                      Tab(
                        icon: Text('Year'),
                      ),
                    ],
                  ),
                ),
                chartOptionNotifier.isGridView == true
                    ? const Expanded(
                        child: TabBarView(
                          children: [
                            ChartBuilderPage(),
                            ChartBuilderPage(),
                            ChartBuilderPage(),
                            ChartBuilderPage(),
                          ],
                        ),
                      )
                    : const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: TabBarView(
                            children: [
                              GridBuilderPage(),
                              GridBuilderPage(),
                              GridBuilderPage(),
                              GridBuilderPage(),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ChangeNotifierProvider<NavBarNotifier>(
          create: (_) => NavBarNotifier(),
          child: Consumer<NavBarNotifier>(
            builder: (context, navBarNotifier, child) => BottomNavigationBar(
              selectedFontSize: 12,
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.airplane_ticket_outlined),
                  label: 'Tickets',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: navBarNotifier.selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: (v) => navBarNotifier.selectedIndex = v,
            ),
          ),
        ),
      ),
    );
  }
}

// for test
class ChartBuilderPage extends StatefulWidget {
  const ChartBuilderPage({Key? key}) : super(key: key);

  @override
  _ChartBuilderPageState createState() => _ChartBuilderPageState();
}

class _ChartBuilderPageState extends State<ChartBuilderPage> {
  final List<ChartData> chartData = [
    ChartData('China', 12, 10, 14, 20),
    ChartData('USA', 14, 11, 18, 23),
    ChartData('UK', 16, 10, 15, 20),
    ChartData('Brazil', 18, 16, 18, 24)
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 400,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y1),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y2),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y3),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y4)
                ])));
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y1,
    this.y2,
    this.y3,
    this.y4,
  );
  final String x;
  final int y1;
  final int y2;
  final int y3;
  final int y4;
}
