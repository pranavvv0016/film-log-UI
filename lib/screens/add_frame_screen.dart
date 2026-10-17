import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AddFrameScreen extends StatefulWidget {
  const AddFrameScreen({super.key});
  @override
  State<AddFrameScreen> createState() => _AddFrameScreenState();
}

class _AddFrameScreenState extends State<AddFrameScreen> {
  double _aperture = 5.6;
  String _shutter = '1/125';
  double _iso = 400;
  final _note = TextEditingController();

  final _shutterOptions = ['1/1000', '1/500', '1/250', '1/125', '1/60', '1/30'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(title: const Text('Log a frame')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text('Exposure', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          _label(context, 'Aperture'),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _aperture,
                  min: 1.4,
                  max: 22,
                  activeColor: AppColors.safelightBright,
                  inactiveColor: AppColors.sprocket,
                  onChanged: (v) => setState(() => _aperture = v),
                ),
              ),
              SizedBox(width: 64, child: Text('f/${_aperture.toStringAsFixed(1)}', style: Theme.of(context).textTheme.titleMedium)),
            ],
          ),
          const SizedBox(height: 12),
          _label(context, 'Shutter speed'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _shutterOptions.map((s) {
              final selected = s == _shutter;
              return ChoiceChip(
                label: Text(s),
                selected: selected,
                onSelected: (_) => setState(() => _shutter = s),
                backgroundColor: AppColors.surface,
                selectedColor: AppColors.safelight,
                labelStyle: TextStyle(color: selected ? AppColors.paper : AppColors.olive),
                side: BorderSide.none,
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          _label(context, 'ISO'),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _iso,
                  min: 100,
                  max: 3200,
                  divisions: 6,
                  activeColor: AppColors.safelightBright,
                  inactiveColor: AppColors.sprocket,
                  onChanged: (v) => setState(() => _iso = v),
                ),
              ),
              SizedBox(width: 64, child: Text('${_iso.round()}', style: Theme.of(context).textTheme.titleMedium)),
            ],
          ),
          const SizedBox(height: 24),
          _label(context, 'Note'),
          TextField(
            controller: _note,
            maxLines: 3,
            style: const TextStyle(color: AppColors.paper),
            decoration: InputDecoration(
              hintText: 'What\u2019s the light doing? Anything worth remembering?',
              hintStyle: const TextStyle(color: AppColors.olive),
              filled: true,
              fillColor: AppColors.surface,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Save frame'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(text, style: Theme.of(context).textTheme.bodySmall),
      );
}
