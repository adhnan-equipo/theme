// lib/features/theme/presentation/widgets/font_family_selector.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamilySelector extends StatelessWidget {
  final String selectedFontFamily;
  final ValueChanged<String> onFontFamilyChanged;

  const FontFamilySelector({
    Key? key,
    required this.selectedFontFamily,
    required this.onFontFamilyChanged,
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
      'PlayfairDisplay', // Changed from 'Playfair Display' to match GoogleFonts naming
      'Merriweather',
      'Ubuntu',
      'Rubik',
      'WorkSans', // Changed from 'Work Sans' to match GoogleFonts naming
      'Quicksand',
      'Inter',
      'OpenSans', // Changed from 'Open Sans' to match GoogleFonts naming
    ];

    // Make sure the selectedFontFamily is in our list, otherwise default to 'Roboto'
    final safeFontFamily =
        popularFonts.contains(selectedFontFamily)
            ? selectedFontFamily
            : 'Roboto';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
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
        // Use try-catch to handle potential errors when displaying the preview
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
      ],
    );
  }
}
