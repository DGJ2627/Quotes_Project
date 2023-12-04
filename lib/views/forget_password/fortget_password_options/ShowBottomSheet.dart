
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/text_string.dart';
import 'ForgetPasswordBtnWidget.dart';

PersistentBottomSheetController<dynamic> buildShowBottomSheet(BuildContext context) {
  return showBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
    context: context,
    builder: (context) => Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text(
             CustomText.forgetPasswordTitle,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
           const Text(
            CustomText.forgetPasswordSubTitle,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          ForgetPasswordBtnWidget(
            onTap: (){
             // Navigator.pop(context);
              Get.back();
              Get.toNamed('/ForgetPassWordMail_Page');
            },
            title: "E-mail",
            subTitle: CustomText.resendEmail,
            btnIcon: Icons.email_outlined,
          ),
          const SizedBox(
            height: 30,
          ),
          ForgetPasswordBtnWidget(
            onTap: (){},
            title: "Phone",
            subTitle: CustomText.phoneNo,
            btnIcon: Icons.phone,
          ),
        ],
      ),
    ),
  );
}