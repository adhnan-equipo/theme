// lib/features/sample/presentation/screens/sample_screen.dart
import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Components'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Basics'),
            Tab(text: 'Inputs'),
            Tab(text: 'Layouts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Basics tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Typography', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 16),
                Text('Display Large', style: theme.textTheme.displayLarge),
                Text('Display Medium', style: theme.textTheme.displayMedium),
                Text('Display Small', style: theme.textTheme.displaySmall),
                Text('Headline Large', style: theme.textTheme.headlineLarge),
                Text('Headline Medium', style: theme.textTheme.headlineMedium),
                Text('Headline Small', style: theme.textTheme.headlineSmall),
                Text('Title Large', style: theme.textTheme.titleLarge),
                Text('Title Medium', style: theme.textTheme.titleMedium),
                Text('Title Small', style: theme.textTheme.titleSmall),
                Text('Body Large', style: theme.textTheme.bodyLarge),
                Text('Body Medium', style: theme.textTheme.bodyMedium),
                Text('Body Small', style: theme.textTheme.bodySmall),
                Text('Label Large', style: theme.textTheme.labelLarge),
                Text('Label Medium', style: theme.textTheme.labelMedium),
                Text('Label Small', style: theme.textTheme.labelSmall),

                const SizedBox(height: 32),
                Text('Colors', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 16),
                _buildColorPalette(context),
              ],
            ),
          ),

          // Inputs tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Buttons', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Elevated'),
                    ),
                    FilledButton(onPressed: () {}, child: const Text('Filled')),
                    FilledButton.tonal(
                      onPressed: () {},
                      child: const Text('Filled Tonal'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Outlined'),
                    ),
                    TextButton(onPressed: () {}, child: const Text('Text')),
                  ],
                ),

                const SizedBox(height: 32),
                Text('Input Fields', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Text Field',
                    hintText: 'Enter some text',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Outlined',
                    hintText: 'Outlined text field',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Filled',
                    hintText: 'Filled text field',
                  ),
                ),

                const SizedBox(height: 32),
                Text(
                  'Selection Controls',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('Checkbox List Tile'),
                  value: true,
                  onChanged: (_) {},
                ),
                SwitchListTile(
                  title: const Text('Switch List Tile'),
                  value: true,
                  onChanged: (_) {},
                ),
                RadioListTile(
                  title: const Text('Radio List Tile'),
                  value: true,
                  groupValue: true,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),

          // Layouts tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cards', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Card Title', style: theme.textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text('This is a basic card with some text content.'),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('ACTION 1'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('ACTION 2'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(child: Text('A')),
                        title: const Text('Card with ListTile'),
                        subtitle: const Text('A description for this card'),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'This card demonstrates using ListTile within a Card widget to create a consistent layout.',
                        ),
                      ),
                      ButtonBar(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('CANCEL'),
                          ),
                          FilledButton(
                            onPressed: () {},
                            child: const Text('ACTION'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                Text('Lists', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text('List Item ${index + 1}'),
                      subtitle: Text('Description for item ${index + 1}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPalette(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildColorItem('Primary', colorScheme.primary, colorScheme.onPrimary),
        _buildColorItem(
          'Secondary',
          colorScheme.secondary,
          colorScheme.onSecondary,
        ),
        _buildColorItem(
          'Tertiary',
          colorScheme.tertiary,
          colorScheme.onTertiary,
        ),
        _buildColorItem('Error', colorScheme.error, colorScheme.onError),
        _buildColorItem('Surface', colorScheme.surface, colorScheme.onSurface),
        _buildColorItem(
          'Background',
          colorScheme.background,
          colorScheme.onBackground,
        ),
      ],
    );
  }

  Widget _buildColorItem(String label, Color color, Color onColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          color: color,
          child: Center(child: Text(label, style: TextStyle(color: onColor))),
        ),
        const SizedBox(height: 4),
        Text(label),
        Text(
          '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
