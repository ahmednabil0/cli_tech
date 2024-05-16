import 'package:day_night_time_picker/day_night_time_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/core/widgets/tff.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradution_project/features/doctor/complete_data/view_model/add_clinic_data/add_clinic_data_bloc.dart';

class CompleteClinicData extends StatefulWidget {
  const CompleteClinicData({super.key});

  @override
  State<CompleteClinicData> createState() => _CompleteClinicDataState();
}

class _CompleteClinicDataState extends State<CompleteClinicData> {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Clinic Data'),
      body:
          Background(child: BlocBuilder<AddClinicDataBloc, AddClinicDataState>(
        builder: (context, state) {
          var instance = BlocProvider.of<AddClinicDataBloc>(context);
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.he(),
                      Container(
                        padding: EdgeInsets.all(15.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                AppConstants.bkImage,
                              ),
                              opacity: 0.3,
                              fit: BoxFit.cover),
                          color: AppColors.scColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.scColor,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              align: TextAlign.start,
                              txt: 'Complete Your Clinic Information',
                              size: AppConstants.mediumText,
                              ml: 10,
                              of: TextOverflow.ellipsis,
                              color: AppColors.redColor.withOpacity(0.7),
                              fw: FontWeight.w800,
                            ),
                            appText(
                              align: TextAlign.start,
                              txt: '● Enter Clinic Address Manually',
                              size: AppConstants.mediumText,
                              of: TextOverflow.ellipsis,
                              color: AppColors.scColor.withOpacity(0.7),
                              fw: FontWeight.w500,
                            ),
                            appText(
                              align: TextAlign.start,
                              txt: '● Pick Your Current Device Location',
                              size: AppConstants.mediumText,
                              of: TextOverflow.ellipsis,
                              color: AppColors.scColor.withOpacity(0.7),
                              fw: FontWeight.w500,
                            ),
                            appText(
                              align: TextAlign.start,
                              txt: '● Fill About Me Feild',
                              size: AppConstants.mediumText,
                              of: TextOverflow.ellipsis,
                              color: AppColors.scColor.withOpacity(0.7),
                              fw: FontWeight.w500,
                            ),
                            appText(
                              align: TextAlign.start,
                              txt: '● Enter Your Years Experience',
                              size: AppConstants.mediumText,
                              of: TextOverflow.ellipsis,
                              color: AppColors.scColor.withOpacity(0.7),
                              fw: FontWeight.w500,
                            ),
                            appText(
                              align: TextAlign.start,
                              txt: '● Select Your Clinic OffDays',
                              size: AppConstants.mediumText,
                              of: TextOverflow.ellipsis,
                              color: AppColors.scColor.withOpacity(0.7),
                              fw: FontWeight.w500,
                            ),
                            appText(
                              align: TextAlign.start,
                              txt: '● Select Your Clinic Workink Hours',
                              size: AppConstants.mediumText,
                              of: TextOverflow.ellipsis,
                              color: AppColors.scColor.withOpacity(0.7),
                              fw: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      10.he(),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              txt: 'Clinic Location',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyCustomTextField(
                                    width: double.infinity,
                                    controller: instance.addressController,
                                    hint: 'Example: 123 Main St, Anytown, USA',
                                  ),
                                ),
                                10.wd(),
                                InkWell(
                                  onTap: () async {
                                    var position = await determinePosition();
                                    instance.address.addAll({
                                      'lat': position.latitude,
                                      'long': position.longitude,
                                    });
                                    print(instance.address);
                                  },
                                  child: Card(
                                    color: AppColors.scColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0.w),
                                      child: Icon(
                                        Icons.location_on_sharp,
                                        color: AppColors.whiteColor,
                                        size: AppConstants.extraText,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            10.he(),
                            appText(
                              txt: 'About Me',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            MyCustomTextField(
                              height: 100.h,
                              width: double.infinity,
                              controller: instance.aboutMeController,
                              max: 7,
                              hint:
                                  'Example:i am doctor and i have 5 years of experience in this field',
                            ),
                            10.he(),
                            appText(
                              txt: 'Years Of Experience',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            MyCustomTextField(
                              width: double.infinity,
                              controller: instance.numOfYearsController,
                              hint: 'Example: 7',
                            ),
                            10.he(),
                            appText(
                              txt: 'Clinic OffDays',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 20.w,
                                children: [
                                  'Sun',
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat'
                                ].map((hour) {
                                  return FilterChip(
                                    backgroundColor:
                                        AppColors.hintColor.withOpacity(
                                      0.15,
                                    ),
                                    selectedColor: AppColors.scColor,
                                    shape: const StadiumBorder(),
                                    checkmarkColor: AppColors.whiteColor,
                                    labelStyle: TextStyle(
                                      color: instance.offDays.contains(hour)
                                          ? AppColors.whiteColor
                                          : AppColors.fontColor,
                                      fontFamily: AppConstants.fontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    label: Text(hour.toString()),
                                    selected: instance.offDays.contains(hour)
                                        ? true
                                        : false,
                                    onSelected: (selected) {
                                      instance.addOffDays(selected, hour);
                                    },
                                  );
                                }).toList()),
                            15.he(),
                            appText(
                              txt: 'Clinic Working Hours',
                              size: AppConstants.largeText,
                              fw: FontWeight.w700,
                            ),
                            4.he(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: AppButton(
                                      border: true,
                                      color:
                                          AppColors.hintColor.withOpacity(0.2),
                                      txt:
                                          'From: ${instance.fromTime != null ? instance.fromTime!.format(context) : 'Select'}',
                                      onTap: () {
                                        Navigator.of(context).push(
                                          showPicker(
                                            showSecondSelector: false,
                                            is24HrFormat: true,

                                            context: context,
                                            value: instance.fromTime ??
                                                instance.time,

                                            onChange: (Time newTime) {
                                              instance.changeFromHour(newTime);
                                            },
                                            onChangeDateTime: (p0) {
                                              print(p0);
                                            },
                                            minuteInterval:
                                                TimePickerInterval.FIVE,
                                            // Optional onChange to receive value as DateTime
                                          ),
                                        );
                                      }),
                                ),
                                5.wd(),
                                Expanded(
                                  child: AppButton(
                                      border: true,
                                      color:
                                          AppColors.hintColor.withOpacity(0.2),
                                      txt:
                                          'To: ${instance.toTime != null ? instance.toTime!.format(context) : 'Select'}',
                                      onTap: () {
                                        Navigator.of(context).push(
                                          showPicker(
                                            showSecondSelector: false,
                                            context: context,
                                            is24HrFormat: true,
                                            value: instance.toTime ??
                                                instance.time,
                                            onChange: (Time newTime) {
                                              instance.changeToHour(newTime);
                                            },
                                            minuteInterval:
                                                TimePickerInterval.FIVE,
                                            // Optional onChange to receive value as DateTime
                                            onChangeDateTime:
                                                (DateTime dateTime) {
                                              // print(dateTime);
                                              debugPrint(
                                                  "[debug datetime]:  $dateTime");
                                            },
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      5.he()
                    ],
                  ),
                ),
              ),
              10.he(),
              AppButton(
                loading: state == const AddClinicDataState.loading(),
                w: double.infinity,
                txt: 'Save Clinic Data',
                onTap: () async {
                  await instance.completeClinicData(context);
                },
              ),
              15.he(),
            ],
          );
        },
      )),
    );
  }
}
