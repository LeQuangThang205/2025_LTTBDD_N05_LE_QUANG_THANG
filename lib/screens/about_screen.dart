import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class AboutScreen extends StatefulWidget {
  final Function(Locale)? onLocaleChange;
  const AboutScreen({super.key, this.onLocaleChange});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late Locale _currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentLocale = Localizations.localeOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // ✅ Lấy ngôn ngữ hiện tại

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.aboutTitle, // ✅ Giới thiệu / About
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          if (widget.onLocaleChange != null)
            DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                value: _currentLocale,
                dropdownColor: Colors.blueAccent,
                iconEnabledColor: Colors.white,
                style: const TextStyle(color: Colors.white),
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
                  if (newLocale != null && newLocale != _currentLocale) {
                    setState(() {
                      _currentLocale = newLocale;
                    });
                    widget.onLocaleChange!(newLocale);
                  }
                },
              ),
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.85),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.appName, // ✅ "BMI Calculator App"
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    loc.aboutDescription,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                  _sectionTitle(loc.sectionFeaturesTitle),
                  _sectionBody(loc.sectionFeaturesBody),
                  _sectionTitle(loc.sectionHighlightsTitle),
                  _sectionBody(loc.sectionHighlightsBody),
                  _sectionTitle(loc.sectionCategoriesTitle),
                  _sectionBody(loc.sectionCategoriesBody),
                  _sectionTitle(loc.sectionWhatIsBMITitle),
                  _sectionBody(loc.sectionWhatIsBMIBody),
                  _sectionTitle(loc.sectionGuideTitle),
                  _sectionBody(loc.sectionGuideBody),
                  _sectionTitle(loc.sectionTechTitle),
                  _sectionBody(loc.sectionTechBody),
                  _sectionTitle(loc.sectionCustomizeTitle),
                  _sectionBody(loc.sectionCustomizeBody),
                  _sectionTitle(loc.sectionJourneyTitle),
                  _sectionBody(loc.sectionJourneyBody),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      );

  Widget _sectionBody(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.5,
          ),
          textAlign: TextAlign.justify,
        ),
      );
}
