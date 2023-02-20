import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import '../components/pin/pin_footer.dart';
import '../components/pin/pin_header.dart';

class EnterPinScreen extends StatelessWidget {
  const EnterPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          PinHeader(),

          PinFooter(),


        ],
      ),
    );
  }
}
