import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/app/app.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({
    super.key,
    required this.child,
    required this.config,
  });

  final AppConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<SettingsRepositoryI>(
        //   create: (context) => SettingsRepository(
        //     preferences: config.preferences,
        //   ),
        // ),
        // RepositoryProvider<NotificationsRepositoryI>(
        //   create: (context) => NotificationsRepository(
        //     localNotifications: config.localNotificationsPlugin,
        //     firebaseMessaging: config.firebaseMessaging,
        //   ),
        // ),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (context) => RhymesListBloc(
          //     apiClient: RhymerApiClient.create(apiUrl: dotenv.env['API_URL']),
          //     historyRepository: context.read<HistoryRepositoryI>(),
          //     favoritesRepositoryInterface: context.read<FavoritesRepositoryI>(),
          //   ),
          // ),
          // BlocProvider(
          //   create: (context) => HistoryRhymesBloc(
          //     historyRepository: context.read<HistoryRepositoryI>(),
          //   ),
          // ),
        ],
        child: child,
      ),
    );
  }
}
