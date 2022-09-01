import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/core/bloc/result_state.dart';
import 'package:examplebasepj/domain/entities/entities.dart';
import 'package:examplebasepj/presentation/bloc/user_list/user_list_bloc.dart';
import 'package:examplebasepj/presentation/bloc/user_list/user_list_event.dart';
import 'package:examplebasepj/presentation/screen/user_detail_screen.dart';
import 'package:examplebasepj/presentation/widgets/card_user.dart';
import 'package:examplebasepj/presentation/widgets/custom_app_bar.dart';
import 'package:examplebasepj/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}


class _UserScreenState extends State<UserScreen> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserListBloc>(context).add(LoadUsers(''));
    _controller.addListener(() {
      BlocProvider.of<UserListBloc>(context).add(LoadUsers(_controller.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Ejemplo Proyecto'),
      body: BlocBuilder<UserListBloc,ResultState<List<UserEntity>>>(
        builder: (context,state){
          return state.when(idle: (){
            return const SizedBox();
          }, loading: () {
            return const Center(child: CircularProgressIndicator(),);
          }, data: (data){
            return Column(
              children: [
                SearchBar(
                  hint: 'Buscar usuario',
                  controller: _controller,
                ),
                Expanded(
                  child: data.isNotEmpty ? ListView.builder(itemBuilder: (context,index){
                    return CardUser(entity: data[index],onTap: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDetailScreen(userEntity: data[index]) ));
                    },showButton: true,);
                  },itemCount: data.length,) : const Center(
                    child: Text('List is empty'),
                  ),
                )
              ],
            );
          }, error: (error){
            return Center(child: Text(NetworkException.getErrorMessage(error),),);
          });
        },
      ),
    );
  }


}
