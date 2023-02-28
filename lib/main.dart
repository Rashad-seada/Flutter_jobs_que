import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/auth/auth_cubit.dart';
import 'package:jobs_que/views/blocs/create_account/create_account_cubit.dart';
import 'package:jobs_que/views/blocs/job_detail/job_detail_cubit.dart';
import 'package:jobs_que/views/blocs/main_layout/main_layout_cubit.dart';
import 'package:jobs_que/views/blocs/on_boarding/on_boarding_cubit.dart';
import 'package:jobs_que/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:jobs_que/views/blocs/search/search_cubit.dart';
import 'package:jobs_que/views/screens/00_splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'core/config/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(

      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      )
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => OnBoardingCubit()),
            BlocProvider(create: (_) => AuthCubit()),
            BlocProvider(create: (_) => CreateAccountCubit()),
            BlocProvider(create: (_) => ResetPasswordCubit()),
            BlocProvider(create: (_) => MainLayoutCubit()),
            BlocProvider(create: (_) => SearchCubit()),
            BlocProvider(create: (_) => JobDetailCubit()),

          ],

          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: AppTheme.getThemeMode(),
              darkTheme: AppTheme.darkTheme,
              theme: AppTheme.theme,
              home: const SplashScreen()
          ),
        );
      },
    );
  }
}
