import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stringee_flutter_plugin_example/blocs/loading_data_bloc.dart';
import 'package:stringee_flutter_plugin_example/models/theme_model.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';
import 'package:stringee_flutter_plugin_example/screens/login_screen.dart';
import 'package:stringee_flutter_plugin_example/screens/screens.dart';
import 'package:stringee_flutter_plugin_example/services/shared_preferences.dart';
import 'package:stringee_flutter_plugin_example/services/user_service.dart';

GetIt getIt = GetIt.instance;
void main() async {
  getIt.registerSingleton<ThemeModel>(ThemeModelImplementation(),
      signalsReady: true);
  getIt.registerLazySingleton<UserService>(() => UserService());
  WidgetsFlutterBinding.ensureInitialized();
  await DataSharedPreferences.init();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stringee flutter sample",
      home: new MyHomePage(),
      // routes: <String, WidgetBuilder>{
      //   '/login': (BuildContext context) => LoginScreen(),
      //   '/resgister': (BuildContext context) => RegistrationScreen(),
      //   '/': (BuildContext context) => CallScreen(),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String token = '';

  @override
  void initState() {
    super.initState();
    token = DataSharedPreferences.getToken() ?? '';

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    if (Platform.isAndroid) {
      requestPermissions();
    }
    // print('token main: $token');
  }

  requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();
    print(statuses);
  }

  @override
  Widget build(BuildContext context) {
    print('token main: $token');
    return Scaffold(
      body: token.isEmpty ? LoginScreen() : CallScreen(),
      // body: MultiBlocProvider(
      //   providers: [
      //     BlocProvider(
      //       create: (BuildContext context) => LoadingDataBloc(),
      //     ),
      //   ],
      //   child: LoginScreen(),
      // ),
    );
  }
}
