// part of 'ticket_app_api.dart';
import 'dart:convert';

import 'package:ticket_app/api/request.dart';
import 'package:ticket_app/model/my_ticket_model.dart';

import '../model/all_ticket_model.dart';
import 'package:http/http.dart' as http;

class TicketServices {
  // for all the tickets
  Future<AllTicketModel> getAllTickets() async {
    final response = await http.get(Uri.parse(kAPI_GetAllTickets));
    if (response.statusCode == 200) {
      return AllTicketModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load all tickets');
    }
  }

// for my tickets
  Future<MyTicketsModel> getMyTickets(String user) async {
    final response = await http.get(Uri.parse('$kAPI_GetMyTickets/user/'));
    if (response.statusCode == 200) {
      return MyTicketsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load all tickets');
    }
  }
}
