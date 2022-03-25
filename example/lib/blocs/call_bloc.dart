import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';
import 'package:stringee_flutter_plugin_example/services/user_service.dart';

// enum CallEvent {
//   second,
//   minute,
// }

// class CallBloc extends Bloc<CallEvent, int> {
//   CallBloc() : super(0);
//   @override
//   Stream<int> mapEventToState(CallEvent event) async* {
//     switch (event) {
//       case CallEvent.second:
//         var second = state + 1;

//         yield second;
//         break;
//       case CallEvent.minute:
//         var minute = state + 1;
//         yield minute;
//         break;
//     }
//   }
// }

enum CallEvent { userData }

// class CallBloc extends Bloc<CallEvent, List<User>> {
class CallBloc extends Cubit<List<User>> {
  List<User> users = [];
  final userService = UserService();
  CallBloc() : super([]);
  @override
  Stream<List<User>> mapEventToState(CallEvent event) async* {
    switch (event) {
      case CallEvent.userData:
        users = await userService.fetchUsers();
        var userList = users;
        yield userList;
        break;
    }
  }
}
