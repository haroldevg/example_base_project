import 'package:examplebasepj/globals/theme_colors.dart';
import 'package:examplebasepj/injectable.dart';
import 'package:examplebasepj/presentation/bloc/post_list/post_list_bloc.dart';
import 'package:examplebasepj/presentation/bloc/user_list/user_list_bloc.dart';
import 'package:examplebasepj/presentation/screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserListBloc>(
          create: (_) => getIt<UserListBloc>(),
        ),
        BlocProvider<PostListBloc>(
          create: (_) => getIt<PostListBloc>(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ThemeColors.primaryColor,
          errorColor: ThemeColors.errorColor
        ),
        home: UserScreen(),
      ),
    );
  }
}
