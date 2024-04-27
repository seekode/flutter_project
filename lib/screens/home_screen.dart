import 'package:codash/providers/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/language/language.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.text),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (ref.read(languageProvider) ==
                          const Locale.fromSubtags(languageCode: 'fr')) {
                        ref.read(languageProvider.notifier).set('en');
                      } else {
                        ref.read(languageProvider.notifier).set('fr');
                      }
                    },
                    child: const Text('changer de langue'),
                  ),
                  ElevatedButton(
                    onPressed: ref.read(themeStateProvider.notifier).toogle,
                    child: const Text('changer de theme'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
