import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobs_que/views/screens/08_main_screen.dart';
import 'package:jobs_que/views/widgets/custom_snack_bar.dart';

import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../../domain/usecases/profile/edit_profile_intersted_work_usecase.dart';
import '../../screens/04_message_screen.dart';
import '../../widgets/custom_page_transition.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  PageController pageController = PageController();

  List workFieldSelected = List.generate(6, (index) => false);
  List countriesSelected = List.generate(13, (index) => false);
  int selectedOption = 0;

  List<Country> countries = [
    Country(flag: "", countryName: "United States" ),
    Country(flag: "", countryName: "Malaysia" ),
    Country(flag: "", countryName: "Singapore" ),
    Country(flag: "", countryName: "Indonesia" ),
    Country(flag: "", countryName: "Philiphines" ),
    Country(flag: "", countryName: "Polandia" ),
    Country(flag: "", countryName: "India" ),
    Country(flag: "", countryName: "Vietnam" ),
    Country(flag: "", countryName: "China" ),
    Country(flag: "", countryName: "Canada" ),
    Country(flag: "", countryName: "Saudi Arabia" ),
    Country(flag: "", countryName: "Argentina" ),
    Country(flag: "", countryName: "Brazil" ),
  ];

  List<WorkField> workFields = [
    WorkField(image: "", fieldName: "UI/UX Designer"),
    WorkField(image: "", fieldName: "Ilustrator Designer"),
    WorkField(image: "", fieldName: "Developer"),
    WorkField(image: "", fieldName: "Management"),
    WorkField(image: "", fieldName: "Information Technology"),
    WorkField(image: "", fieldName: "Research and Analytics"),
  ];

  List<String> workOptions = [
    AppStrings.createAccountThirdOption1,
    AppStrings.createAccountThirdOption2
  ];

  String getSelectedOption(){
    return workOptions[selectedOption];
  }

  String getSelectedCountry(){
    List<String> selectedCountriesNames = [];
    for(int i = 0; i <  countriesSelected.length; ++i) {
      if(countriesSelected[i] == true) selectedCountriesNames.add(countries[i].countryName);
    }
    return selectedCountriesNames.join(", ");
  }

  String getSelectedWorkFields(){
    List<String> selectedWorkFieldsTitle = [];
    for(int i = 0; i <  workFieldSelected.length; ++i) {
      if(workFieldSelected[i] == true) selectedWorkFieldsTitle.add(workFields[i].fieldName);
    }
    return selectedWorkFieldsTitle.join(", ");
  }

  void createAccount(BuildContext context){
    emit(CreateAccountIsLoading());
    EditProfileInterstedWorkUsecase().call(ProfileInterstedWorkParams(
        interstedWork: getSelectedWorkFields(),
        offlinePlace: getSelectedCountry(),
        remotePlace: getSelectedOption(),
    )).then(
      (value) => value.bimap(
              (error) {
                ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context, message: error.message, iconImage: AppImages.error));
              },
              (success) {
                if(success.status == true) {
                  Navigator.push(context, CustomPageTransition(
                    MessageScreen(
                      image: AppImages.accountCreatedSuccessfully,
                      headText: AppStrings.createAccountFourthHeadText,
                      subText: AppStrings.createAccountFourthBodyText1,
                      buttonLable: AppStrings.getStarted,
                      onTap: (){
                        Navigator.push(context,CustomPageTransition(const MainScreen()));
                      },
                    ),
                  ));
                  emit(CreateAccountInitial());

                }else {
                  ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context, message: "Please select your preferences and try again ", iconImage: AppImages.error));
                  emit(CreateAccountInitial());
                }
              }
      )
    );
  }

  onButtonTap({required int currentIndex,required BuildContext context}){
    if(currentIndex == 1){
      createAccount(context);
    }else{
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    }
  }

}

class Country {
  String flag;
  String countryName;

  Country({
    required this.flag,
    required this.countryName
  });
}

class WorkField {
  String image;
  String fieldName;

  WorkField({
    required this.image,
    required this.fieldName
  });
}
