import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:examplebasepj/injectable.config.dart';


final GetIt getIt = GetIt.instance;

@injectableInit
void configureDependencies(String env) => $initGetIt(getIt, environment: env);