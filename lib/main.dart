import 'package:flutter/material.dart';
import 'package:gtd_manager/app/app.dart';
import 'package:gtd_manager/features/notes/data/entyties/note_entity.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  const notesBox = 'inbox_notes';
  await Hive.openBox


  runApp(const GtdManager());
}
