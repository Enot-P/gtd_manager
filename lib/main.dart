import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gtd_manager/app/app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() {
  Bloc.observer = TalkerBlocObserver();
  runApp(
    const GtdManager(),
  );
}
