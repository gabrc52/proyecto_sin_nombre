import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lenguas/models/settings.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<Settings>(
          builder: (context, settings, child) => SettingsList(
            backgroundColor: Colors.transparent,
            sections: [
              SettingsSection(
                title: 'Apariencia',
                tiles: [
                  SettingsTile(
                    title: 'Tema',
                    subtitle: settings.theme.string(),
                    leading: Icon(Icons.lightbulb),
                    onPressed: (BuildContext context) {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          title: Text('Tema'),
                          children: [
                            for (var value in ThemeMode.values)
                              RadioListTile<ThemeMode>(
                                title: Text('${value.string()}'),
                                value: value,
                                groupValue: settings.theme,
                                onChanged: (value) {
                                  settings.theme = value;
                                  Navigator.of(context).pop();
                                },
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  SettingsTile(
                    title: 'Estilo',
                    subtitle: settings.useIOSStyle ? 'iOS' : 'Android',
                    leading: Icon(
                      settings.useIOSStyle
                          ? Ionicons.logo_apple
                          : Icons.android,
                    ),
                    onPressed: (context) => showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: Text('Estilo'),
                        children: [
                          RadioListTile<bool>(
                            title: Text('iOS'),
                            value: true,
                            groupValue: settings.useIOSStyle,
                            onChanged: (value) {
                              settings.useIOSStyle = value;
                              Navigator.of(context).pop();
                            },
                          ),
                          RadioListTile<bool>(
                            title: Text('Android'),
                            value: false,
                            groupValue: settings.useIOSStyle,
                            onChanged: (value) {
                              settings.useIOSStyle = value;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}