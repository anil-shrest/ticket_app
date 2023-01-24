import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/notifiers/chart_option_notifier.dart';
import 'package:ticket_app/notifiers/nav_bar_notifier.dart';
import 'package:ticket_app/notifiers/ticket_notifier.dart';
import 'package:ticket_app/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChartOptionNotifier>(
            create: (_) => ChartOptionNotifier()),
        ChangeNotifierProvider<NavBarNotifier>(create: (_) => NavBarNotifier()),
        ChangeNotifierProvider<TicketNotifier>(create: (_) => TicketNotifier()),
      ],
      child: MaterialApp(
        title: 'Ticket App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
