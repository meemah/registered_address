import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registered_address/model/address.dart';
import 'package:registered_address/util/custom_input_formatter.dart';
import 'package:registered_address/util/validators.dart';
import 'package:registered_address/view/widgets/custom_button.dart';
import 'package:registered_address/view/widgets/custom_textfield.dart';
import 'package:registered_address/view/widgets/success_dialog.dart';

class ResidentialAddressView extends HookWidget with Validators {
  final addressFormKey = GlobalKey<FormState>();
  ResidentialAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    var isFormValidated = useState(false);
    var countryCtrl = useTextEditingController();
    var prefectureCtrl = useTextEditingController();
    var municipalityCtrl = useTextEditingController();
    var streetCtrl = useTextEditingController();
    var apartmentCtl = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 5.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 5.h,
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5.h,
                    color: Colors.grey.shade200,
                  ),
                )
              ],
            )),
        centerTitle: true,
        title: Text(
          "Registered Address",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18.sp),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: addressFormKey,
            onChanged: () =>
                isFormValidated.value = addressFormKey.currentState!.validate(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  "Please enter information as written\non your ID document",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomTextField(
                  readOnly: true,
                  suffixIcon: Icon(
                    CupertinoIcons.search,
                    size: 18.sp,
                  ),
                  onTap: () {
                    showCountryPicker(
                        countryListTheme: const CountryListThemeData(
                            inputDecoration:
                                InputDecoration(hintText: "Enter country")),
                        useSafeArea: true,
                        context: context,
                        onSelect: (country) {
                          countryCtrl.text = country.name;
                        });
                  },
                  validator: requiredFieldValidator(
                    errorMessage: "Select your country",
                  ),
                  controller: countryCtrl,
                  hintText: "Country",
                ),
                CustomTextField(
                  validator: requiredFieldValidator(
                    errorMessage: "Enter your residential prefecture",
                  ),
                  controller: prefectureCtrl,
                  hintText: "Prefecture",
                ),
                CustomTextField(
                  validator: requiredFieldValidator(
                    errorMessage: "Enter your Municipality",
                  ),
                  controller: municipalityCtrl,
                  hintText: "Municipality",
                ),
                CustomTextField(
                  formatter: [AddressInputFormatter()],
                  validator: requiredFieldValidator(
                      errorMessage: "Enter your Street address"),
                  controller: streetCtrl,
                  hintText: "Street address(subarea-block-house)",
                ),
                CustomTextField(
                  validator: requiredFieldValidator(
                      errorMessage: "Enter your Apartment"),
                  controller: apartmentCtl,
                  hintText: "Apartment, suite or unit",
                ),
                const Spacer(),
                CustomButton(
                    isButtonEnabled: isFormValidated.value,
                    buttonTitle: "Next",
                    onTap: () {
                      Address address = Address(
                          country: countryCtrl.text.trim(),
                          prefecture: prefectureCtrl.text.trim(),
                          municipality: municipalityCtrl.text.trim(),
                          streetAddress: streetCtrl.text.trim(),
                          apartment: apartmentCtl.text.trim());
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SuccessDialog(
                            address: address,
                          );
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
