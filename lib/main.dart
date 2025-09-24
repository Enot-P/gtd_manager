import 'package:flutter/widgets.dart';
import 'package:gtd_manager/app/app.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init(settings: TalkerSettings());

void main() {
  runTalkerZonedGuarded(
    talker,
    () => runApp(const GtdManager()),
    (e, st) => talker.handle(e, st),
  );
}
