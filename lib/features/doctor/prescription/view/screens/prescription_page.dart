import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/space.dart';
import 'package:gradution_project/core/widgets/text.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/navigate.dart';
import '../../../../../core/widgets/buld_app_bar.dart';
import '../../../../../core/widgets/images/custom_image.dart';
import '../../../../../core/widgets/images/profile_image.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({super.key});

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  int count = 0;
  int count2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        splashColor: AppColors.scColor.withOpacity(0.5),
        onPressed: () {},
        label: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: appText(
                txt: "Add",
                size: AppConstants.largeText,
                fw: FontWeight.bold,
                color: AppColors.whiteColor)),
        backgroundColor: AppColors.scColor,
      ),
      appBar: buildAppBar(context: context, title: 'Add Prescription'),
      body: Background(
        pad: 13,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HSizedBox(
                  he: 15.h,
                ),
                appText(
                    txt: 'Name',
                    size: AppConstants.largeText,
                    fw: FontWeight.bold,
                    color: AppColors.blackColor.withOpacity(0.6)),
                const HSizedBox(),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.blackColor),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  ),
                  keyboardType: TextInputType.name,
                ),
                HSizedBox(
                  he: 15.h,
                ),
                appText(
                    txt: 'Doctor\'s Report',
                    size: AppConstants.largeText,
                    fw: FontWeight.bold,
                    color: AppColors.blackColor.withOpacity(0.6)),
                const HSizedBox(),
                SizedBox(
                  height: 70.h,
                  child: TextFormField(
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: 'Write a note..',
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.blackColor),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                HSizedBox(
                  he: 15.h,
                ),
                appText(
                    txt: 'Drugs Name',
                    size: AppConstants.largeText,
                    fw: FontWeight.bold,
                    color: AppColors.blackColor.withOpacity(0.6)),
                const HSizedBox(),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.blackColor),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const HSizedBox(),
                Divider(color: AppColors.blackColor.withOpacity(0.3)),
                const HSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(
                          txt: 'Dosage',
                          size: AppConstants.largeText,
                          fw: FontWeight.bold,
                          color: AppColors.blackColor.withOpacity(0.6)),
                      RichText(
                        text: TextSpan(
                          text: 'Duration ',
                          style: TextStyle(
                              fontSize: AppConstants.largeText,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor.withOpacity(0.6)),
                          children: [
                            TextSpan(
                              text: 'Week',
                              style: TextStyle(
                                fontSize: AppConstants.largeText,
                                fontWeight: FontWeight.bold,
                                color: AppColors.scColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const HSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              count == 0 ? print('count at 0 !') : count--;
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.remove,
                                //color: AppColors.whiteColor,
                                size: 15,
                              ),
                            ),
                          ),
                          const WSizedBox(),
                          appText(
                              txt: "$count Tablet",
                              size: AppConstants.largeText),
                          const WSizedBox(),
                          InkWell(
                            onTap: () => setState(() {
                              count++;
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                //color: AppColors.whiteColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              count2 == 0 ? print('count2 at 0 !') : count2--;
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.remove,
                                //color: AppColors.whiteColor,
                                size: 15,
                              ),
                            ),
                          ),
                          const WSizedBox(),
                          appText(
                              txt: "$count2 Week",
                              size: AppConstants.largeText),
                          const WSizedBox(),
                          InkWell(
                            onTap: () => setState(() {
                              count2++;
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                //color: AppColors.whiteColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const HSizedBox(),
                appText(
                    txt: 'Repeat',
                    size: AppConstants.largeText,
                    fw: FontWeight.bold,
                    color: AppColors.blackColor.withOpacity(0.6)),
                const HSizedBox(
                  he: 2,
                ),
                Row(
                  children: [
                    CustomRadioButton(
                      elevation: 1,
                      defaultSelected: 'Everyday',
                      autoWidth: true,
                      enableShape: true,
                      selectedBorderColor: AppColors.scColor,
                      unSelectedBorderColor: AppColors.scColor,
                      unSelectedColor: AppColors.whiteColor,
                      selectedColor: AppColors.scColor,
                      buttonLables: const [
                        'Everyday',
                        'Alternate Days',
                        'Specific Days',
                      ],
                      buttonValues: const [
                        'Everyday',
                        'Alternate Days',
                        'Specific Days',
                      ],
                      buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      radioButtonValue: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
                const HSizedBox(
                  he: 2,
                ),
                appText(
                    txt: 'Time of the day',
                    size: AppConstants.largeText,
                    fw: FontWeight.bold,
                    color: AppColors.blackColor.withOpacity(0.6)),
                const HSizedBox(
                  he: 2,
                ),
                Row(
                  children: [
                    CustomCheckBoxGroup(
                      buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      selectedBorderColor: AppColors.scColor,
                      unSelectedBorderColor: AppColors.scColor,
                      unSelectedColor: AppColors.whiteColor,
                      selectedColor: AppColors.scColor,
                      autoWidth: true,
                      enableShape: true,
                      defaultSelected: const ['Morning', 'Noon'],
                      buttonLables: const [
                        "Morning",
                        "Noon",
                        "Night",
                        "Evening",
                      ],
                      buttonValuesList: const [
                        "Morning",
                        "Noon",
                        "Night",
                        "Evening",
                      ],
                      checkBoxButtonValues: (values) {
                        print(values);
                      },
                      spacing: 0,
                      width: 40,
                      absoluteZeroSpacing: false,
                    ),
                  ],
                ),
                const HSizedBox(
                  he: 2,
                ),
                appText(
                    txt: 'To be Taken',
                    size: AppConstants.largeText,
                    fw: FontWeight.bold,
                    color: AppColors.blackColor.withOpacity(0.6)),
                const HSizedBox(he: 2),
                Row(
                  children: [
                    CustomRadioButton(
                      elevation: 1,
                      defaultSelected: 'After Food',
                      autoWidth: true,
                      enableShape: true,
                      selectedBorderColor: AppColors.scColor,
                      unSelectedBorderColor: AppColors.scColor,
                      unSelectedColor: AppColors.whiteColor,
                      selectedColor: AppColors.scColor,
                      buttonLables: const [
                        'After Food',
                        'Before Food',
                      ],
                      buttonValues: const [
                        'After Food',
                        'Before Food',
                      ],
                      buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      radioButtonValue: (value) {
                        print(value);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
