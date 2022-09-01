import 'package:bloc/bloc.dart';
import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/core/bloc/result_state.dart';
import 'package:examplebasepj/domain/entities/post_entity.dart';
import 'package:examplebasepj/domain/usecases/post_list_usecase.dart';
import 'package:examplebasepj/presentation/bloc/post_list/post_list_event.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostListBloc extends Bloc<PostListEvent,ResultState<List<PostEntity>>>{

  final PostListUseCase _useCase;

  PostListBloc(this._useCase) : super(const Idle()){
    on<LoadPosts>(_onLoadPosts);
  }

  void _onLoadPosts(PostListEvent event, Emitter<ResultState<List<PostEntity>>> emitter) async{

    emit(const Loading());

    try{
      final posts = await _useCase.getPosts(event.userId);
      emit(Data(data: posts));
    } on NetworkException catch(e){
      emit(Error(error: e));
    }

  }


}