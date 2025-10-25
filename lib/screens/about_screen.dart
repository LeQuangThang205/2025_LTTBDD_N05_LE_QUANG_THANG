import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  final Function(Locale)? onLocaleChange;
  const AboutScreen({super.key, this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    if (loc == null)
      return const SizedBox.shrink(); // Hành vi fallback nếu loc null
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        actions: [
          if (onLocaleChange != null)
            DropdownButton<Locale>(
              value: Localizations.localeOf(context),
              dropdownColor: Colors.blue[700],
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
                if (newLocale != null && onLocaleChange != null) {
                  onLocaleChange!(newLocale);
                }
              },
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.aboutTitle,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      loc.aboutDescription,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 24),
                    _buildSection(loc.aboutTeam, loc.aboutTeamDetails),
                    _buildSection(loc.developerInfo, loc.developerDetails),
                    _buildSection(loc.aboutContact, loc.aboutContactDetails),
                    _buildSection(loc.appInfoTitle, loc.appInfoDescription),
                    _buildSection(loc.featuresTitle, loc.featuresDescription),
                    _buildSection(
                        loc.bmiCategoriesTitle, loc.bmiCategoriesDescription),
                    _buildSection(
                        loc.gettingStartedTitle, loc.gettingStartedDescription),
                    _buildSection(loc.techStackTitle, loc.techStackDescription),
                    _buildSection(
                        loc.customizationTitle, loc.customizationDescription),
                    _buildSection(
                        loc.healthJourneyTitle, loc.healthJourneyDescription),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.5,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
