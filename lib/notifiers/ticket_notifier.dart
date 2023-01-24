import 'package:flutter/cupertino.dart';
import 'package:ticket_app/api/all_ticket.part.dart';
import 'package:ticket_app/model/all_ticket_model.dart';

class TicketNotifier extends ChangeNotifier {
  final _ticketServices = TicketServices();

  AllTicketModel? _allTickets;

  AllTicketModel? get allTickets => _allTickets;

  Future<void> fetchAllTickets() async {
    AllTicketModel allTicketsModel = await _ticketServices.getAllTickets();
    _allTickets = allTicketsModel;
    notifyListeners();
  }
}
