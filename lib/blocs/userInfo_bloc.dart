import 'package:bloc/bloc.dart';
class UserInfoState {
  Object _curUserInfo;

  get userInfo => _curUserInfo;

  UserInfoState(this._curUserInfo);
}

class UserInfoEvent {
  Object _userInfo;

  get userInfo => _userInfo;

  UserInfoEvent(this._userInfo);
}

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(null);

  @override
  get initialState => UserInfoState(null);

  @override
  Stream<UserInfoState> mapEventToState(UserInfoEvent event) async* {
    yield UserInfoState(event.userInfo);
  }
}