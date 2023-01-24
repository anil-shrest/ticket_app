import 'package:flutter/material.dart';

/// Notifier for chart selection option
class ChartOptionNotifier extends ChangeNotifier {
  // for chart view
  bool _isChartView = true;

  bool get isChartView => _isChartView;

  set isChartView(bool val) {
    _isChartView = val;
    notifyListeners();
  }

  // for grid view
  bool _isGridView = false;

  bool get isGridView => _isGridView;

  set isGridView(bool val) {
    _isGridView = val;
    notifyListeners();
  }

  // for selected tab option
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    notifyListeners();
  }
}
