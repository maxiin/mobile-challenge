import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_challenge/modules/user_details/domain/usecases/get_user.dart';
import 'package:mobile_challenge/modules/user_details/presentation/bloc/user_detail_event.dart';
import 'package:mobile_challenge/modules/user_details/presentation/bloc/user_detail_state.dart';
import 'package:mobile_challenge/shared/entities/User.dart';

//TODO i18n
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUser getUserUseCase;

  UserDetailBloc({
    @required GetUser getUser,
  })  : assert(getUser != null),
        getUserUseCase = getUser,
        super(null);

  @override
  UserDetailState get initialState => Empty();

  @override
  Stream<UserDetailState> mapEventToState(
    UserDetailEvent event,
  ) async* {
    if (event is GetUserEvent) {
      yield Loading();
      try {
        final User result = await getUserUseCase(GetUserParams(event.nickname));
        yield Loaded(user: result);
      } catch (err) {
        yield* _errorHandler(err);
      }
    }
  }

  //TODO
  Stream<UserDetailState> _errorHandler(dynamic response) async* {
    //handle Error()
  }
}
