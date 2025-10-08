import 'package:flutter/widgets.dart';
import 'package:gtd_manager/app/app.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final talker = TalkerFlutter.init(settings: TalkerSettings());

Future<void> main() async {
  await runTalkerZonedGuarded(
    talker,
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      talker.info(app.options.projectId);
      runApp(const GtdManager());
    },
    (e, st) => talker.handle(e, st),
  );
}
