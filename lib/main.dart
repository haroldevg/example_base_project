import 'package:bloc/bloc.dart';
import 'package:examplebasepj/app.dart';
import 'package:examplebasepj/core/bloc/simple_bloc_observer.dart';
import 'package:examplebasepj/injectable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Environment.prod);

  BlocOverrides.runZoned(
        () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}