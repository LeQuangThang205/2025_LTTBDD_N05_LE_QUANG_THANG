import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 150;
  double _weight = 60;
  int _age = 25;
  String _gender = 'Male';
  late Locale _locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locale = Localizations.localeOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/history'); // Chuyển đến HistoryScreen
            },
          ),
          DropdownButton<Locale>(
            value: _locale,
            items: const [
              DropdownMenuItem(
                value: Locale('en'),
                child: Text('EN'),
              ),
              DropdownMenuItem(
                value: Locale('vi'),
                child: Text('VI'),
              ),
            ],
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                widget.onLocaleChange(newLocale);
                setState(() {
                  _locale = newLocale;
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/home.jpg'),
            fit: BoxFit.fill, // Sử dụng fill để ảnh full, bỏ qua tỷ lệ gốc
            opacity: 0.3, // Giữ mờ
            onError: (exception, stackTrace) => LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.2),
                Colors.blue.withOpacity(0.1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(loc.height,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Slider(
                          value: _height,
                          min: 100,
                          max: 220,
                          onChanged: (value) => setState(() => _height = value),
                        ),
                        Text('${_height.round()} cm'),
                        const SizedBox(height: 16),
                        Text(loc.weight,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Slider(
                          value: _weight,
                          min: 30,
                          max: 150,
                          onChanged: (value) => setState(() => _weight = value),
                        ),
                        Text('${_weight.round()} kg'),
                        const SizedBox(height: 16),
                        Text(loc.age,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Slider(
                          value: _age.toDouble(),
                          min: 10,
                          max: 100,
                          onChanged: (value) =>
                              setState(() => _age = value.round()),
                        ),
                        Text('$_age'),
                        const SizedBox(height: 16),
                        Text(loc.gender,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(loc.male),
                            Radio<String>(
                              value: 'Male',
                              groupValue: _gender,
                              onChanged: (value) =>
                                  setState(() => _gender = value!),
                            ),
                            Text(loc.female),
                            Radio<String>(
                              value: 'Female',
                              groupValue: _gender,
                              onChanged: (value) =>
                                  setState(() => _gender = value!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final bmi =
                            _weight / ((_height / 100) * (_height / 100));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ResultScreen(bmi: bmi, weight: _weight),
                          ),
                        );
                      },
                      child: Text(loc.calculate),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
