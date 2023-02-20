import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import '../components/reset_password/reset_password_footer.dart';
import '../components/reset_password/reset_password_header.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [

            ResetPasswordHeader(),

            ResetPasswordFooter(),

          ],
        ),
      ),
    );
  }
}
