import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/app/app_config.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/features/notes/bloc/list_note/list_note_bloc.dart';
import 'package:gtd_manager/domain/repositories/list_notes_repositories.dart';
import 'package:gtd_manager/main.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

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
    Bloc.observer = TalkerBlocObserver(talker: talker);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Talker>(create: (context) => talker),
        RepositoryProvider<GtdDatabase>(create: (_) => GtdDatabase()),
        RepositoryProvider<ListNotesRepository>(
          create: (context) => ListNotesRepository(context.read<GtdDatabase>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ListNoteBloc(context.read<ListNotesRepository>()),
          ),
        ],
        child: child,
      ),
    );
  }
}
