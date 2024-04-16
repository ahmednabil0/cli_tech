import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/static_data/drugs/data_json.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';

import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';

import '../../../../../core/widgets/buld_app_bar.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({super.key, required this.data});
  final Map data;

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController drugQtController = TextEditingController();

  String? drugName;

  String? drugQt;

  String? drugDu;

  List<Map> treatmantPlan = [];

  @override
  Widget build(BuildContext context) {
    // print(drugModels);

    return Scaffold(
      appBar: buildAppBar(title: 'Prescription', context: context),
      body: Background(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.he(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                  txt: 'Name:${widget.data['name']}',
                  size: AppConstants.largeText,
                  fw: FontWeight.w700,
                ),
                appText(
                    txt: 'Date:2024/4/4',
                    size: AppConstants.mediumText,
                    fw: FontWeight.w500,
                    color: AppColors.scColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                  txt: 'Age: 22 Years',
                  size: AppConstants.mediumText,
                  fw: FontWeight.w500,
                ),
                Container(
                  height: 30.h,
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                    color: AppColors.primaryColor.withOpacity(0.2),
                  ),
                  child: Center(
                    child: appText(
                      txt: 'Examination',
                      size: AppConstants.mediumText,
                      color: AppColors.fontColor,
                      fw: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.hintColor,
            ),
            10.he(),
            appText(
              txt: 'Patient Report:',
              size: AppConstants.largeText,
              fw: FontWeight.w700,
            ),
            MyCustomTextField(
              height: 80.h,
              width: double.infinity,
              max: 4,
              controller: TextEditingController(),
              hint:
                  'Examble:The patient complains of severe pain in the lower right abdomen, accompanied by high fever and nausea. ',
            ),
            10.he(),
            appText(
              txt: 'Temperature:',
              size: AppConstants.largeText,
              fw: FontWeight.w700,
            ),
            MyCustomTextField(
              width: double.infinity,
              controller: TextEditingController(),
              hint: 'Example: 39.2 degrees Celsius.',
            ),
            10.he(),
            appText(
              txt: 'Blood Pressure:',
              size: AppConstants.largeText,
              fw: FontWeight.w700,
            ),
            MyCustomTextField(
              width: double.infinity,
              controller: TextEditingController(),
              hint: 'Example: 120/80 mmHg.',
            ),
            10.he(),
            appText(
              txt: 'Abdomen:',
              size: AppConstants.largeText,
              fw: FontWeight.w700,
            ),
            MyCustomTextField(
              height: 70.h,
              width: double.infinity,
              max: 3,
              controller: TextEditingController(),
              hint:
                  'Examble:The patient feels pain when pressure is applied to the lower right side of the abdomen.',
            ),
            10.he(),
            Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.scColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: appText(
                        txt: 'Treatment Plan:',
                        size: AppConstants.largeText,
                        fw: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomDropdown<DrugModel>.search(
                        validator: FormBuilderValidators.required(),
                        hintText: 'Select Drug Name',
                        canCloseOutsideBounds: true,
                        noResultFoundBuilder: (context, text) => Center(
                          child: Padding(
                            padding: EdgeInsets.all(14.0.h),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  color: Colors.red,
                                  size: 15.h,
                                ),
                                appText(
                                  align: TextAlign.start,
                                  ph: 0,
                                  txt: '*$text*',
                                  color: Colors.red,
                                  size: AppConstants.smallText,
                                  fw: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),
                        hintBuilder: (context, hint) {
                          return appText(
                              align: TextAlign.start,
                              txt: hint,
                              color: AppColors.hintColor,
                              size: AppConstants.smallText,
                              fw: FontWeight.w500);
                        },
                        items: drugList,
                        excludeSelected: false,
                        maxlines: 3,
                        onChanged: (value) {
                          drugName = '${value.name}/${value.type}';
                          setState(() {});
                        },
                      ),
                    ),
                    10.he(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              txt: 'Dosage',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            MyCustomTextField(
                              width: 120.w,
                              controller: drugQtController,
                              validator: FormBuilderValidators.required(),
                              hint: 'Times To take',
                              onChanged: (value) {
                                drugQt = value;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              txt: 'Duration',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            SizedBox(
                              width: 150.w,
                              child: CustomDropdown<String>.search(
                                validator: FormBuilderValidators.required(),
                                hintText: 'Select Duration',
                                canCloseOutsideBounds: true,
                                noResultFoundBuilder: (context, text) => Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(14.0.h),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.error_outline_rounded,
                                          color: Colors.red,
                                          size: 15.h,
                                        ),
                                        appText(
                                          align: TextAlign.start,
                                          ph: 0,
                                          txt: '*$text*',
                                          color: Colors.red,
                                          size: AppConstants.smallText,
                                          fw: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                hintBuilder: (context, hint) {
                                  return appText(
                                      align: TextAlign.start,
                                      txt: hint,
                                      color: AppColors.hintColor,
                                      size: AppConstants.smallText,
                                      fw: FontWeight.w500);
                                },
                                items: const ['Day', 'Week', 'Month', 'Year'],
                                excludeSelected: false,
                                maxlines: 3,
                                onChanged: (value) {
                                  drugDu = value;
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    10.he(),
                    AppButton(
                      txt: 'Add Drug',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          treatmantPlan.add(
                            {
                              'drug': drugName,
                              'duration': drugDu,
                              'times': drugQt,
                            },
                          );
                          setState(() {});
                        }
                      },
                      w: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
            10.he(),
            Container(
              // height: 150.h,
              width: double.infinity,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.scColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20.w,
                  children: treatmantPlan.map((hour) {
                    return InkWell(
                      onLongPress: () {
                        treatmantPlan.remove(hour);
                        setState(() {});
                      },
                      child: FilterChip(
                        backgroundColor: AppColors.scColor,
                        shape: const StadiumBorder(),
                        // checkmarkColor: AppColors.whiteColor,
                        labelStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontFamily: AppConstants.fontFamily,
                          fontWeight: FontWeight.w700,
                        ),
                        label: appText(
                            txt:
                                '${hour['drug']} - ${hour['times']} every ${hour['duration']}',
                            size: AppConstants.smallText,
                            color: AppColors.whiteColor),
                        onSelected: (selected) {},
                      ),
                    );
                  }).toList()),
            ),
            50.he(),
          ],
        ),
      )),
    );
  }
}
