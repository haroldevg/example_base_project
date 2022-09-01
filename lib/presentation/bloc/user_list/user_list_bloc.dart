import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/core/bloc/result_state.dart';
import 'package:examplebasepj/domain/entities/entities.dart';
import 'package:examplebasepj/domain/usecases/user_list_usecase.dart';
import 'package:examplebasepj/presentation/bloc/user_list/user_list_event.dart';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserListBloc extends Bloc<UserListEvent,ResultState<List<UserEntity>>> {

  final UserListUserCase _userCase;

  UserListBloc(this._userCase) : super(const Idle()){

    on<LoadUsers>(_onLoadUsers);

  }

  void _onLoadUsers(UserListEvent event, Emitter<ResultState<List<UserEntity>>> emitter) async {

    emit(const Loading());
    try{
      final users = await _userCase.getUsers(event.text.trim());
      emit(Data(data: users));
    } on NetworkException catch(e){
      emit(Error(error: e));
    }

  }

}