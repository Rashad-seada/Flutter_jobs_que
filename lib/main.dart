import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jobs_que/views/blocs/apply_job/apply_job_cubit.dart';
import 'package:jobs_que/views/blocs/auth/auth_cubit.dart';
import 'package:jobs_que/views/blocs/complete_profile/complete_profile_cubit.dart';
import 'package:jobs_que/views/blocs/core/core_cubit.dart';
import 'package:jobs_que/views/blocs/create_account/create_account_cubit.dart';
import 'package:jobs_que/views/blocs/job_detail/job_detail_cubit.dart';
import 'package:jobs_que/views/blocs/language/language_cubit.dart';
import 'package:jobs_que/views/blocs/main_layout/main_layout_cubit.dart';
import 'package:jobs_que/views/blocs/message/message_cubit.dart';
import 'package:jobs_que/views/blocs/on_boarding/on_boarding_cubit.dart';
import 'package:jobs_que/views/blocs/profile/profile_cubit.dart';
import 'package:jobs_que/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:jobs_que/views/blocs/saved/saved_cubit.dart';
import 'package:jobs_que/views/blocs/search/search_cubit.dart';
import 'package:jobs_que/views/screens/00_splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'core/config/app_const.dart';
import 'core/config/app_theme.dart';
import 'data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'data/data_source/local_data_source/jobs/jobs_local_data_source.dart';
import 'data/data_source/remote_data_source/jobs/jobs_remote_data_source.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
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
  void initState() {
    appInit();
    super.initState();
  }

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
            BlocProvider(create: (_) => ApplyJobCubit()),
            BlocProvider(create: (_) => SavedCubit()),
            BlocProvider(create: (_) => MessageCubit()),
            BlocProvider(create: (_) => ProfileCubit()),
            BlocProvider(create: (_) => LanguageCubit()),
            BlocProvider(create: (_) => CompleteProfileCubit()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: AppTheme.getThemeMode(),
              darkTheme: AppTheme.darkTheme,
              theme: AppTheme.theme,
              home: const SplashScreen()),
        );
      },
    );
  }
}

void appInit(){
  JobsLocalDataSourceImpl().dbInit();
  AuthLocalDataSourceImpl().dbInit();
}