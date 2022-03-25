// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stringee_flutter_plugin_example/models/user.dart';

// enum UserEvent {
//   loading,
//   // done,
// }

// class UserBloc extends Bloc<UserEvent, bool> {
//   UserBloc() : super(false);
//   @override
//   Stream<bool> mapEventToState(UserEvent event) async* {
//     switch (event) {
//       case UserEvent.loading:
//         yield true;
//         break;
//     }
//   }
// }

// // enum UserEvent {
// //   loading,
// // }

// // class UserBloc extends Bloc<UserEvent, User> {
// //   UserBloc() : super(null);
// //   @override
// //   Stream<User> mapEventToState(UserEvent event) async* {
// //     switch (event) {
// //       case UserEvent.loading:
// //         // yield true;
// //         break;
// //     }
// //   }
// // }

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

enum UserEvent { userData }

class UserBloc extends Bloc<UserEvent, List<User>> {
// class UserBloc extends Cubit<List<User>> {
  List<User> users = [];
  final userService = UserService();
  UserBloc() : super([]);
  @override
  Stream<List<User>> mapEventToState(UserEvent event) async* {
    switch (event) {
      case UserEvent.userData:
        users = await userService.fetchUsers();
        var userList = users;

        yield userList;
        break;
    }
  }
}
