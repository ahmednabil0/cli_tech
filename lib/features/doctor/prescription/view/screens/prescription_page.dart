import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/static_data/drugs/data_json.dart';
import 'package:gradution_project/core/static_data/lap_tests_names.dart';
import 'package:gradution_project/core/static_data/symptoms/symtoms.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';

import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:gradution_project/features/doctor/prescription/view_model/prescrption/prescrption_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/widgets/buld_app_bar.dart';

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    // print(drugModels);

    return Scaffold(
      appBar: buildAppBar(title: 'Prescription', context: context),
      body: Background(child: BlocBuilder<PrescrptionBloc, PrescrptionState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<PrescrptionBloc>(context);

          return Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    15.he(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              txt: 'Name:${data['name']}',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            appText(
                                txt: 'Date:${data['date']}',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w500,
                                color: AppColors.scColor),
                            appText(
                              txt: 'Age: 21 Years',
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
                                  txt: '${data['type']}',
                                  size: AppConstants.mediumText,
                                  color: AppColors.fontColor,
                                  fw: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(1.w),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: QrImageView(
                            data: '${data['id']}+${data['date']}',
                            size: 110.w,
                            version: QrVersions.auto,
                            dataModuleStyle: const QrDataModuleStyle(
                              color: AppColors.scColor,
                              dataModuleShape: QrDataModuleShape.circle,
                            ),
                            eyeStyle: const QrEyeStyle(
                              color: AppColors.primaryColor,
                              eyeShape: QrEyeShape.square,
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
                      controller: bloc.reportController,
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
                      controller: bloc.tempController,
                      customTextInputType: TextInputType.number,
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
                      customTextInputType: TextInputType.datetime,
                      controller: bloc.bloodController,
                      onChanged: (value) {
                        EasyDebounce.debounce('two', Durations.medium1, () {
                          bloc.addSlash();
                        });
                      },
                      hint: 'Example: 120/80 mmHg.',
                    ),
                    10.he(),
                    Container(
                      padding: EdgeInsets.all(
                        10.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.scColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: appText(
                              txt: 'Symptoms:',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                          ),
                          Form(
                            key: bloc.formSymKey,
                            child: SizedBox(
                              width: double.infinity,
                              child: CustomDropdown<String>.search(
                                validator: FormBuilderValidators.required(),
                                hintText: 'Select Patient Symptoms',
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
                                items: symptoms
                                    .map(
                                      (e) => e['Symptom'].toString(),
                                    )
                                    .toList(),
                                excludeSelected: false,
                                maxlines: 3,
                                onChanged: (value) {
                                  bloc.addSymptomToList(value);
                                },
                              ),
                            ),
                          ),
                          10.he(),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(16.r),
                            strokeCap: StrokeCap.butt,
                            strokeWidth: 2,
                            borderPadding:
                                EdgeInsets.symmetric(horizontal: 2.w),
                            color: AppColors.scColor,
                            dashPattern: const [10, 1],
                            child: Container(
                              // height: 150.h,
                              width: double.infinity,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.scColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  spacing: 20.w,
                                  children: bloc.symptoms.map((hour) {
                                    return InkWell(
                                      onLongPress: () {
                                        bloc.removeSymptom(value: hour);
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
                                            txt: hour,
                                            size: AppConstants.smallText,
                                            color: AppColors.whiteColor),
                                        onSelected: (selected) {},
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                          5.he(),
                          AppButton(
                              r: 10.r,
                              loading: state ==
                                      const PrescrptionState
                                          .prescrptionGenratedLoading()
                                  ? true
                                  : false,
                              color: AppColors.primaryColor.withOpacity(0.8),
                              w: double.infinity,
                              ts: AppConstants.smallText,
                              txt: 'Show Expected Disease Info',
                              onTap: () async {
                                if (bloc.symptoms.isNotEmpty) {
                                  await bloc.generateRecommendaions(
                                    bloc.symptoms,
                                    context,
                                  );
                                }
                              }),
//                           appText(
//                             align: TextAlign.start,
//                             ml: 20,
//                             txt: """TECHNICAL SKILLS
// • Flutter , dart(oop)
// • Firebase (firestore , firestorage,FCM , real
//   time database )
// • Upload apps in Google play
// • Other skills (Python , java , c#)""",
//                             color: AppColors.hintColor,
//                             size: AppConstants.smallText,
//                             fw: FontWeight.w500,
//                           )
                        ],
                      ),
                    ),
                    15.he(),
                    Form(
                      key: bloc.formKey,
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
                                  bloc.addDrug(value: value);
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
                                      customTextInputType: TextInputType.number,
                                      controller: bloc.drugQtController,
                                      validator:
                                          FormBuilderValidators.required(),
                                      hint: 'Times To take',
                                      onChanged: (value) {
                                        bloc.addDrugQt(value: value);
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
                                        validator:
                                            FormBuilderValidators.required(),
                                        hintText: 'Select Duration',
                                        canCloseOutsideBounds: true,
                                        noResultFoundBuilder: (context, text) =>
                                            Center(
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
                                        items: const [
                                          'Day',
                                          'Week',
                                          'Month',
                                          'Year'
                                        ],
                                        excludeSelected: false,
                                        maxlines: 3,
                                        onChanged: (value) {
                                          bloc.addDrugDuration(value: value);
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
                                bloc.addDrugToTreatmentPlan();
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
                        color: AppColors.scColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 20.w,
                          children: bloc.treatmantPlan.map((hour) {
                            return InkWell(
                              onLongPress: () {
                                bloc.removeDrug(hour);
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
                    10.he(),
                    Form(
                      key: bloc.formLapKey,
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
                                txt: 'Required Test:',
                                size: AppConstants.largeText,
                                fw: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CustomDropdown<String>.search(
                                validator: FormBuilderValidators.required(),
                                hintText: 'Select Test Name',
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
                                items: medicalTestsAbbreviations,
                                excludeSelected: false,
                                maxlines: 3,
                                onChanged: (value) {
                                  bloc.addTest(value: value);
                                },
                              ),
                            ),
                            10.he(),
                            AppButton(
                              txt: 'Add Test',
                              color: AppColors.scColor.withOpacity(0.7),
                              onTap: () {
                                bloc.addRequiredTest();
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
                          spacing: 10.w,
                          children: bloc.requiredTests.map((hour) {
                            return InkWell(
                              onLongPress: () {
                                bloc.removeRequiredTest(value: hour);
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
                                  txt: hour,
                                  size: AppConstants.smallText,
                                  color: AppColors.whiteColor,
                                ),
                                onSelected: (selected) {},
                              ),
                            );
                          }).toList()),
                    ),
                    20.he(),
                  ],
                )),
              ),
              AppButton(
                txt: 'Finish Examination',
                loading: state == const PrescrptionState.prescrptionLoading(),
                onTap: () async {
                  await bloc.addPrescription(data, context);
                },
                w: double.infinity,
              ),
              10.he(),
            ],
          );
        },
      )),
    );
  }
}
