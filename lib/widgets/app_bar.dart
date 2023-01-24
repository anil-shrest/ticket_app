import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/notifiers/chart_option_notifier.dart';

/// Custom app bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget action;
  final double height;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.action,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          stops: const [0.0, 0.6],
          colors: [
            Colors.blue.shade200,
            Colors.blueAccent,
          ],
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: title,
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ticket Details',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 0.1,
                      ),
                ),
                ChangeNotifierProvider(
                  create: (_) => ChartOptionNotifier(),
                  child: Consumer<ChartOptionNotifier>(
                    builder: (context, chartOptionNotifier, child) => Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            chartOptionNotifier.isChartView =
                                !chartOptionNotifier.isChartView;
                            chartOptionNotifier.isGridView = false;
                          },
                          child: Container(
                            height: 33,
                            width: 52,
                            decoration: BoxDecoration(
                              color: chartOptionNotifier.isChartView
                                  ? Colors.blueAccent
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              ),
                            ),
                            child: Icon(
                              Icons.list,
                              color: chartOptionNotifier.isChartView
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            chartOptionNotifier.isGridView =
                                !chartOptionNotifier.isGridView;
                            chartOptionNotifier.isChartView = false;
                          },
                          child: Container(
                            height: 33,
                            width: 52,
                            decoration: BoxDecoration(
                              color: chartOptionNotifier.isGridView
                                  ? Colors.blueAccent
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                            child: Icon(
                              Icons.show_chart,
                              color: chartOptionNotifier.isGridView
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [action],
      ),
    );
  }
}
