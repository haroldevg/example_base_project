import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/core/bloc/result_state.dart';
import 'package:examplebasepj/domain/entities/entities.dart';
import 'package:examplebasepj/domain/entities/post_entity.dart';
import 'package:examplebasepj/globals/theme_colors.dart';
import 'package:examplebasepj/presentation/bloc/post_list/post_list_bloc.dart';
import 'package:examplebasepj/presentation/bloc/post_list/post_list_event.dart';
import 'package:examplebasepj/presentation/widgets/card_post.dart';
import 'package:examplebasepj/presentation/widgets/card_user.dart';
import 'package:examplebasepj/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailScreen extends StatefulWidget {

  final UserEntity userEntity;

  const UserDetailScreen({Key? key, required this.userEntity})
      : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostListBloc>(context).add(LoadPosts(widget.userEntity.id));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Detalle'),
      body: BlocBuilder<PostListBloc, ResultState<List<PostEntity>>>(
        builder: (context, state) {
          return state.when(
              idle: () {
                return const SizedBox();
              }, loading: () {
                return const Center(child: CircularProgressIndicator(),);
          }, data: (data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CardUser(entity: widget.userEntity, showButton: false,),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context,index){
                        return CardPost(entity: data[index]);
                      },itemCount: data.length,),
                    )
                  ],
                );

          }, error: (error) {
                return Center(child: Text(NetworkException.getErrorMessage(error)),);
          });
        },
      ),
    );
  }
}
