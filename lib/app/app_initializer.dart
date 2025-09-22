import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/app/app_config.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/features/notes/bloc/note_bloc.dart';
import 'package:gtd_manager/features/notes/data/repositories/list_notes_repositories.dart';
import 'package:talker/talker.dart';

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
        RepositoryProvider<Talker>(create: (context) => config.talker),
        RepositoryProvider<DatabaseConfigure>(create: (_) => DatabaseConfigure()),
        RepositoryProvider<DatabaseOperations>(
          create: (context) => DatabaseOperations(context.read<DatabaseConfigure>()),
        ),
        RepositoryProvider<ListNotesRepository>(
          create: (context) => ListNotesRepository(context.read<DatabaseOperations>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NoteBloc(
              context.read<ListNotesRepository>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
