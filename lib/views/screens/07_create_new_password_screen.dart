import 'package:flutter/material.dart';
import '../components/create_new_password/create_new_password_footer.dart';
import '../components/create_new_password/create_new_password_header.dart';
import '../widgets/main_scaffold.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          CreateNewPasswordHeader(),

          const CreateNewPasswordFooter(),

        ],
      ),
    );
  }
}
