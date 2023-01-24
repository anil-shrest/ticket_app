import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/notifiers/chart_option_notifier.dart';
import 'package:ticket_app/notifiers/ticket_notifier.dart';

/// widget for building grid view as per the duration
class GridBuilderPage extends StatefulWidget {
  const GridBuilderPage({super.key});

  @override
  State<GridBuilderPage> createState() => _GridBuilderPageState();
}

class _GridBuilderPageState extends State<GridBuilderPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TicketNotifier>(context, listen: false).fetchAllTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ChartOptionNotifier chartOptionNotifier =
        Provider.of<ChartOptionNotifier>(context, listen: true);
    return Consumer<TicketNotifier>(
      builder: (context, ticketNotifier, child) => GridView.builder(
        itemCount: ticketNotifier.allTickets?.data.dist.day.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.airplane_ticket_outlined),
                  Text(ticketNotifier.allTickets?.data.dist.day[index].label ??
                      'a'),
                  chartOptionNotifier.selectedTab == 0
                      ? Text(ticketNotifier
                              .allTickets?.data.dist.day[index].value ??
                          'b')
                      : chartOptionNotifier.selectedTab == 1
                          ? Text(ticketNotifier
                                  .allTickets?.data.dist.week[index].value ??
                              'a')
                          : chartOptionNotifier.selectedTab == 2
                              ? Text(ticketNotifier.allTickets?.data.dist
                                      .month[index].value ??
                                  'a')
                              : Text(ticketNotifier.allTickets?.data.dist
                                      .year[index].value ??
                                  'a'),
                ],
              ));
        },
      ),
    );
  }
}
