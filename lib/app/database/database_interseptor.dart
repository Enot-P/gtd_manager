import 'dart:async';

import 'package:drift/drift.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DriftLog extends TalkerLog {
  DriftLog(String super.message);

  static String get getTitle => 'Drift';
  static String get getKey => 'drift_log_key';
  static AnsiPen get getPen => AnsiPen()..yellow();

  @override
  String get title => getTitle;

  @override
  String get key => getKey;

  @override
  AnsiPen get pen => getPen;
}

extension DriftTalker on Talker {
  void drift(String message) {
    logCustom(DriftLog(message));
  }
}

class DataBaseInterceptor extends QueryInterceptor {
  final Talker talker;

  DataBaseInterceptor({required this.talker});

  Future<T> _run<T>(String description, FutureOr<T> Function() operation) async {
    final stopwatch = Stopwatch()..start();
    talker.drift('Running $description');

    try {
      final result = await operation();
      talker.drift(' => succeeded after ${stopwatch.elapsedMilliseconds}ms');
      return result;
    } on Object catch (e) {
      talker.drift(' => failed after ${stopwatch.elapsedMilliseconds}ms ($e)');
      rethrow;
    }
  }

  @override
  TransactionExecutor beginTransaction(QueryExecutor parent) {
    talker.drift('begin');
    return super.beginTransaction(parent);
  }

  @override
  Future<void> commitTransaction(TransactionExecutor inner) {
    return _run('commit', () => inner.send());
  }

  // INFO: почему-то в стоке не пашит (из доки ctrl+c + ctrl+v)
  // @override
  // Future<void> rollbackTransaction(QueryExecutor inner) {
  //   return _run('rollback', () => inner.rollback());
  // }

  @override
  Future<void> runBatched(QueryExecutor executor, BatchedStatements statements) {
    return _run('batch with $statements', () => executor.runBatched(statements));
  }

  @override
  Future<int> runInsert(QueryExecutor executor, String statement, List<Object?> args) {
    return _run('$statement with $args', () => executor.runInsert(statement, args));
  }

  @override
  Future<int> runUpdate(QueryExecutor executor, String statement, List<Object?> args) {
    return _run('$statement with $args', () => executor.runUpdate(statement, args));
  }

  @override
  Future<int> runDelete(QueryExecutor executor, String statement, List<Object?> args) {
    return _run('$statement with $args', () => executor.runDelete(statement, args));
  }

  @override
  Future<void> runCustom(QueryExecutor executor, String statement, List<Object?> args) {
    return _run('$statement with $args', () => executor.runCustom(statement, args));
  }

  @override
  Future<List<Map<String, Object?>>> runSelect(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    return _run('$statement with $args', () => executor.runSelect(statement, args));
  }
}
