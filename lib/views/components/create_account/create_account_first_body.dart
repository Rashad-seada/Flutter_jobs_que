import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';
import '../../blocs/create_account/create_account_cubit.dart';
import 'field_card.dart';

class CreateAccountFirstBody extends StatelessWidget {

  CreateAccountFirstBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70.h,
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 7 / 6,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (_, index) {
              return BlocConsumer<CreateAccountCubit, CreateAccountState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: FadeInAnimation(
                      duration: Duration(milliseconds: 300),
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 300),
                        child: FieldCard(
                          isSelected: context.read<CreateAccountCubit>().workFieldSelected[index],
                          index: index,
                          field: context.read<CreateAccountCubit>().workFields[index],
                        )
                      ),
                    ),
                  );
                  
                },
              );
            }
        )
    );
  }
}

