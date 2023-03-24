import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_enums.dart';
import 'package:jobs_que/views/blocs/auth/auth_cubit.dart';
import '../blocs/core/core_cubit.dart';
import '../components/auth/auth_body.dart';
import '../components/auth/auth_footer.dart';
import '../widgets/main_scaffold.dart';

class AuthScreen extends StatelessWidget {
  AuthOptions option;

  AuthScreen({
    required this.option,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              AnimatedSwitcher(
                  duration:Duration(milliseconds: 1000),
                  child: AuthBody()),

              AnimatedSwitcher(
                  duration:Duration(milliseconds: 1000),
                  child: AuthFooter()),

            ],
          );
        },
      ),
    );
  }
}
