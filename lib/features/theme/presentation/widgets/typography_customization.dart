// lib/features/theme/presentation/widgets/typography_customization.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypographyCustomizationWidget extends StatelessWidget {
  final String fontFamily;
  final double textScaleFactor;
  final bool useM3Typography;
  final bool useGoogleFonts;
  final FontWeight titleFontWeight;
  final FontWeight bodyFontWeight;
  final ValueChanged<String> onFontFamilyChanged;
  final ValueChanged<double> onTextScaleFactorChanged;
  final ValueChanged<bool> onUseM3TypographyChanged;
  final ValueChanged<bool> onUseGoogleFontsChanged;
  final ValueChanged<FontWeight> onTitleFontWeightChanged;
  final ValueChanged<FontWeight> onBodyFontWeightChanged;

  const TypographyCustomizationWidget({
    Key? key,
    required this.fontFamily,
    required this.textScaleFactor,
    required this.useM3Typography,
    required this.useGoogleFonts,
    required this.titleFontWeight,
    required this.bodyFontWeight,
    required this.onFontFamilyChanged,
    required this.onTextScaleFactorChanged,
    required this.onUseM3TypographyChanged,
    required this.onUseGoogleFontsChanged,
    required this.onTitleFontWeightChanged,
    required this.onBodyFontWeightChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of reliable Google Fonts
    final popularFonts = [
      'Poppins',
      'Roboto',
      'Lato',
      'Montserrat',
      'Oswald',
      'Raleway',
      'Nunito',
      'PlayfairDisplay',
      'Merriweather',
      'Ubuntu',
      'Rubik',
      'WorkSans',
      'Quicksand',
      'Inter',
      'OpenSans',
    ];

    // Make sure the selectedFontFamily is in our list, otherwise default to 'Roboto'
    final safeFontFamily =
        popularFonts.contains(fontFamily) ? fontFamily : 'Roboto';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Typography',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Font Selection
        DropdownButtonFormField<String>(
          value: safeFontFamily,
          decoration: const InputDecoration(
            labelText: 'Font Family',
            border: OutlineInputBorder(),
          ),
          items:
              popularFonts.map((font) {
                // Use try-catch to handle any potential font loading errors
                Widget fontText;
                try {
                  fontText = Text(font, style: GoogleFonts.getFont(font));
                } catch (e) {
                  // Fallback to default text style if font can't be loaded
                  fontText = Text(
                    '$font (unavailable)',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  );
                }

                return DropdownMenuItem<String>(value: font, child: fontText);
              }).toList(),
          onChanged: (value) {
            if (value != null) {
              onFontFamilyChanged(value);
            }
          },
        ),

        const SizedBox(height: 16),

        // Font Preview
        Builder(
          builder: (context) {
            try {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The quick brown fox jumps over the lazy dog.',
                    style: GoogleFonts.getFont(
                      safeFontFamily,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    'ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789',
                    style: GoogleFonts.getFont(
                      safeFontFamily,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              );
            } catch (e) {
              return const Text(
                'Error displaying font preview',
                style: TextStyle(color: Colors.red),
              );
            }
          },
        ),

        const SizedBox(height: 24),

        // Font Weights
        Text(
          'Title Font Weight',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        SegmentedButton<FontWeight>(
          segments: [
            const ButtonSegment<FontWeight>(
              value: FontWeight.normal,
              label: Text('Normal'),
            ),
            ButtonSegment<FontWeight>(
              value: FontWeight.bold,
              label: Text('Medium'),
            ),
            const ButtonSegment<FontWeight>(
              value: FontWeight.bold,
              label: Text('Bold'),
            ),
          ],
          selected: {titleFontWeight},
          onSelectionChanged: (Set<FontWeight> selection) {
            if (selection.isNotEmpty) {
              onTitleFontWeightChanged(selection.first);
            }
          },
        ),

        const SizedBox(height: 16),

        Text('Body Font Weight', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        SegmentedButton<FontWeight>(
          segments: [
            const ButtonSegment<FontWeight>(
              value: FontWeight.normal,
              label: Text('Normal'),
            ),
            ButtonSegment<FontWeight>(
              value: FontWeight.bold,
              label: const Text('Medium'),
            ),
            const ButtonSegment<FontWeight>(
              value: FontWeight.bold,
              label: Text('Bold'),
            ),
          ],
          selected: {bodyFontWeight},
          onSelectionChanged: (Set<FontWeight> selection) {
            if (selection.isNotEmpty) {
              onBodyFontWeightChanged(selection.first);
            }
          },
        ),

        const SizedBox(height: 24),

        // Text Scale Factor
        Text(
          'Text Scale Factor: ${textScaleFactor.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Slider(
          value: textScaleFactor,
          min: 0.8,
          max: 1.4,
          divisions: 6,
          label: textScaleFactor.toStringAsFixed(1),
          onChanged: onTextScaleFactorChanged,
        ),

        const SizedBox(height: 16),

        // Typography Options
        SwitchListTile(
          title: const Text('Use Material 3 Typography'),
          subtitle: const Text('Apply Material 3 text theme styles'),
          value: useM3Typography,
          onChanged: onUseM3TypographyChanged,
        ),

        SwitchListTile(
          title: const Text('Use Google Fonts'),
          subtitle: const Text(
            'Fetch fonts from Google (may require internet)',
          ),
          value: useGoogleFonts,
          onChanged: onUseGoogleFontsChanged,
        ),
      ],
    );
  }
}
