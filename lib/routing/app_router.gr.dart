// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CalendarScreen]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalendarScreen();
    },
  );
}

/// generated route for
/// [DetailsNoteScreen]
class DetailsNoteRoute extends PageRouteInfo<DetailsNoteRouteArgs> {
  DetailsNoteRoute({
    Key? key,
    required int noteId,
    List<PageRouteInfo>? children,
  }) : super(
         DetailsNoteRoute.name,
         args: DetailsNoteRouteArgs(key: key, noteId: noteId),
         initialChildren: children,
       );

  static const String name = 'DetailsNoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsNoteRouteArgs>();
      return DetailsNoteScreen(key: args.key, noteId: args.noteId);
    },
  );
}

class DetailsNoteRouteArgs {
  const DetailsNoteRouteArgs({this.key, required this.noteId});

  final Key? key;

  final int noteId;

  @override
  String toString() {
    return 'DetailsNoteRouteArgs{key: $key, noteId: $noteId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailsNoteRouteArgs) return false;
    return key == other.key && noteId == other.noteId;
  }

  @override
  int get hashCode => key.hashCode ^ noteId.hashCode;
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ListNotesScreen]
class ListNotesRoute extends PageRouteInfo<ListNotesRouteArgs> {
  ListNotesRoute({
    Key? key,
    required NoteCategory noteCategory,
    required String name,
    required String description,
    List<PageRouteInfo>? children,
  }) : super(
         ListNotesRoute.name,
         args: ListNotesRouteArgs(
           key: key,
           noteCategory: noteCategory,
           name: name,
           description: description,
         ),
         initialChildren: children,
       );

  static const String name = 'ListNotesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListNotesRouteArgs>();
      return ListNotesScreen(
        key: args.key,
        noteCategory: args.noteCategory,
        name: args.name,
        description: args.description,
      );
    },
  );
}

class ListNotesRouteArgs {
  const ListNotesRouteArgs({
    this.key,
    required this.noteCategory,
    required this.name,
    required this.description,
  });

  final Key? key;

  final NoteCategory noteCategory;

  final String name;

  final String description;

  @override
  String toString() {
    return 'ListNotesRouteArgs{key: $key, noteCategory: $noteCategory, name: $name, description: $description}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ListNotesRouteArgs) return false;
    return key == other.key &&
        noteCategory == other.noteCategory &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      noteCategory.hashCode ^
      name.hashCode ^
      description.hashCode;
}

/// generated route for
/// [ProjectsScreen]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute({List<PageRouteInfo>? children})
    : super(ProjectsRoute.name, initialChildren: children);

  static const String name = 'ProjectsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectsScreen();
    },
  );
}

/// generated route for
/// [TagsScreen]
class TagsRoute extends PageRouteInfo<void> {
  const TagsRoute({List<PageRouteInfo>? children})
    : super(TagsRoute.name, initialChildren: children);

  static const String name = 'TagsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TagsScreen();
    },
  );
}
