import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/enums.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          AuthBody(option: option,),

          AuthFooter(option: option,),

        ],
      ),
    );
  }
}
