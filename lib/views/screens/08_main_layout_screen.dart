import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/main_layout/main_layout_cubit.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';

import '../components/main_layout/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: BlocConsumer<MainLayoutCubit, MainLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(

            body: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: context.read<MainLayoutCubit>().pages[context.read<MainLayoutCubit>().currentIndex],
            ),

            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 5),
              child: CustomNavBar(
                currentIndex: context.read<MainLayoutCubit>().currentIndex,
                labels: context.read<MainLayoutCubit>().navBarLabels,
                onTap: (index) => context.read<MainLayoutCubit>().onTap(index),

              ),
            ),
          );
        },
      ),
    );
  }
}
