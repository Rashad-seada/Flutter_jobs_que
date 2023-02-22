import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';

import '../widgets/custom_text.dart';

class AppliedPage extends StatelessWidget {
  const AppliedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Center(child: CustomText('Applied')),

    );
  }
}