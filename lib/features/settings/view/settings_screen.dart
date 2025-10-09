import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gtd_manager/features/settings/widgets/widgets.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Настройки',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: UserProfileCardWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SettingsCardWidget(
                title: 'Настройки приложения',
                items: [
                  GoogleSyncSetting(),
                  SettingsItem(
                    title: 'Тема приложения',
                    subtitle: 'Системная',
                    icon: Icons.dark_mode_outlined,
                  ),
                  SettingsItem(
                    title: 'Язык',
                    subtitle: 'Русский',
                    icon: Icons.language_outlined,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SettingsCardWidget(
                title: 'О приложении',
                items: [
                  SettingsItem(
                    title: 'О приложении',
                    subtitle: 'Версия: dev',
                    icon: Icons.info_outline,
                  ),
                  SettingsItem(
                    title: 'Отправить отзыв',
                    subtitle: 'Поделитесь вашим мнением',
                    icon: Icons.feedback_outlined,
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
