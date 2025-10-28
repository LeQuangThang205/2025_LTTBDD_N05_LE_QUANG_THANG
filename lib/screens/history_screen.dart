import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  final Function(Locale)? onLocaleChange;
  const HistoryScreen({super.key, this.onLocaleChange});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _history = prefs.getStringList('bmi_history') ?? [];
    });
  }

  List<FlSpot> _getChartData() {
    List<FlSpot> spots = [];
    for (int i = 0; i < _history.length; i++) {
      try {
        final entry = _history[i];
        // Format: "2025-10-23 12:00:00: BMI 22.5, Normal"
        final bmiMatch = RegExp(r'BMI\s([\d.]+)').firstMatch(entry);
        if (bmiMatch != null) {
          final bmi = double.tryParse(bmiMatch.group(1) ?? '0') ?? 0.0;
          spots.add(FlSpot(i.toDouble(), bmi));
        }
      } catch (e) {
        debugPrint('Error parsing BMI at index $i: $e');
      }
    }
    return spots;
  }

  void _updateLocale(Locale newLocale) {
    widget.onLocaleChange?.call(newLocale);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.history,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 4,
        actions: [
          if (widget.onLocaleChange != null)
            DropdownButton<Locale>(
              value: Localizations.localeOf(context),
              dropdownColor: Colors.blue[700],
              style: const TextStyle(color: Colors.white),
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('EN', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('vi'),
                  child: Text('VI', style: TextStyle(color: Colors.white)),
                ),
              ],
              onChanged: (Locale? newLocale) {
                if (newLocale != null) _updateLocale(newLocale);
              },
            ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.trendChart,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: _history.isEmpty
                            ? Center(
                                child: Text(
                                  loc.noHistoryData,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              )
                            : LineChart(
                                LineChartData(
                                  gridData: FlGridData(
                                    show: true,
                                    drawVerticalLine: true,
                                    getDrawingHorizontalLine: (value) => FlLine(
                                      color: Colors.grey.withOpacity(0.2),
                                      strokeWidth: 1,
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 22,
                                        getTitlesWidget: (value, meta) {
                                          final index = value.toInt();
                                          if (index >= _history.length)
                                            return const Text('');
                                          final entry = _history[index];
                                          final date = entry.split(' ')[0];
                                          return Text(
                                            date,
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black54),
                                          );
                                        },
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 28,
                                        getTitlesWidget: (value, meta) =>
                                            Text('${value.toInt()}'),
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                      show: true,
                                      border:
                                          Border.all(color: Colors.black12)),
                                  minX: 0,
                                  maxX: _history.isNotEmpty
                                      ? _history.length.toDouble() - 1
                                      : 0,
                                  minY: 15,
                                  maxY: 35,
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: _getChartData(),
                                      isCurved: true,
                                      color: Colors.blue[700],
                                      barWidth: 2,
                                      dotData: FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) {
                                          return FlDotCirclePainter(
                                            radius: 3,
                                            color: Colors.blue[700]!,
                                            strokeWidth: 0,
                                          );
                                        },
                                      ),
                                      belowBarData: BarAreaData(
                                          show: true,
                                          color: Colors.blue.withOpacity(0.1)),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  loc.history,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(height: 8),
              _history.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          loc.noHistoryData,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _history.length,
                      itemBuilder: (context, index) {
                        try {
                          final entry = _history[index];
                          final parts = entry.split(': ');
                          final date =
                              parts.isNotEmpty ? parts[0].substring(0, 10) : '';
                          final details =
                              parts.length > 1 ? parts[1] : loc.unknown;
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            color: Colors.white,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              title: Text(
                                details,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                date,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  _history.removeAt(index);
                                  await prefs.setStringList(
                                      'bmi_history', _history);
                                  setState(() {});
                                },
                              ),
                            ),
                          );
                        } catch (e) {
                          debugPrint('Error at index $index: $e');
                          return const SizedBox.shrink();
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
