import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/extensions/gaps.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/widgets/buld_app_bar.dart';
import 'package:gradution_project/core/widgets/button.dart';
import 'package:gradution_project/core/widgets/circle_pro_ind.dart';
import 'package:gradution_project/core/widgets/sized_box.dart';
import 'package:gradution_project/core/widgets/text.dart';
import 'package:gradution_project/features/patient/doctor_info/view_model/doctor_info/doctor_info_bloc.dart';

class DoctorInfoPage extends StatefulWidget {
  const DoctorInfoPage({super.key});

  @override
  State<DoctorInfoPage> createState() => _DoctorInfoPageState();
}

class _DoctorInfoPageState extends State<DoctorInfoPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late LinkPageController pageController;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    pageController = LinkPageController();

    _controller.addListener(() {
      if (_controller.indexIsChanging || pageController.keepScrollOffset) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorInfoBloc, DoctorInfoState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<DoctorInfoBloc>(context);
        return Scaffold(
          appBar: buildAppBar(
              title: state == const DoctorInfoState.loaded()
                  ? 'Dr. ${bloc.doctorInfo!['name']}'
                  : 'Loading...',
              context: context),
          body: Background(
            child: state == const DoctorInfoState.loading()
                ? const Center(
                    child: SpinKitDancingSquare(
                      color: AppColors.scColor,
                    ),
                  )
                : Column(
                    children: [
                      10.he(),
                      SizedBox(
                        height: 80.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              bloc.doctorInfo!['photo'] == null
                                  ? Image.asset(
                                      AppConstants.doctorProfile,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: CachedNetworkImage(
                                          imageUrl: bloc.doctorInfo!['photo']),
                                    ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      appText(
                                        txt: 'Dr. ${bloc.doctorInfo!['name']}',
                                        size: AppConstants.largeText,
                                        fw: FontWeight.w800,
                                      ),
                                      appText(
                                        txt:
                                            'Dr. ${bloc.doctorInfo!['specialty']}',
                                        size: AppConstants.smallText,
                                        fw: FontWeight.w500,
                                        color: AppColors.hintColor,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.yellow.shade600,
                                            size: 20.w,
                                          ),
                                          appText(
                                            txt: '4.8 (10 reviews)',
                                            size: AppConstants.verySmallText,
                                            fw: FontWeight.w500,
                                            color: AppColors.hintColor,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // SvgPicture.asset(
                              //   AppConstants.messageIcon,
                              // )
                            ],
                          ),
                        ),
                      ),
                      10.he(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          appText(
                            txt: 'About Me',
                            size: AppConstants.mediumText,
                            fw: FontWeight.w700,
                            color: _controller.index == 0
                                ? AppColors.scColor
                                : AppColors.hintColor,
                          ),
                          appText(
                            txt: 'Location',
                            fw: FontWeight.w700,
                            color: _controller.index == 1
                                ? AppColors.scColor
                                : AppColors.hintColor,
                            size: AppConstants.mediumText,
                          ),
                          // appText(
                          //   txt: 'Reveiws',
                          //   size: AppConstants.mediumText,
                          //   fw: FontWeight.w700,
                          //   color: _controller.index == 2
                          //       ? AppColors.scColor
                          //       : AppColors.hintColor,
                          // ),
                        ],
                      ),
                      CarouselIndicator(
                        controller: _controller,
                        tapEnable: true,
                        selectedColor: AppColors.scColor,
                        unselectedColor: Colors.grey[300],
                        strokeCap: StrokeCap.round,
                        size: Size(110.w, 3.h),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 0.w),
                      ),
                      25.he(),
                      Expanded(
                          child: ExtendedTabBarView(
                        controller: _controller,
                        pageController: LinkPageController(),
                        // physics: const NeverScrollableClampingScrollPhysics(),
                        children: const <Widget>[
                          AboutMePage(),
                          DoctorLocationPage(),
                          // DoctorReviewPage(),
                        ],
                      )),
                      10.he(),
                      AppButton(
                        w: double.infinity,
                        h: 40.h,
                        txt: 'Make An Appointment',
                        onTap: () {
                          navigateReplace(
                            context: context,
                            route: Routes.bookAppointmentPage,
                          );
                        },
                      ),
                      20.he()
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorInfoBloc, DoctorInfoState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<DoctorInfoBloc>(context);
        return Scaffold(
          body: bloc.doctorInfo == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 42.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: AppColors.redColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.r),
                                    bottomRight: Radius.circular(15.r),
                                  ),
                                ),
                                child: Icon(
                                  Icons.workspace_premium_rounded,
                                  color: AppColors.redColor.withOpacity(
                                    0.2,
                                  ),
                                  size: 30.w,
                                ),
                              ),
                              4.he(),
                              appText(
                                txt: '${bloc.doctorInfo!['numOfYears']} Yrs',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w600,
                              ),
                              appText(
                                txt: 'Experience',
                                size: AppConstants.verySmallText,
                                color: AppColors.hintColor,
                                fw: FontWeight.w600,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 42.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: AppColors.scColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.r),
                                    bottomRight: Radius.circular(15.r),
                                  ),
                                ),
                                child: Icon(
                                  Icons.workspace_premium_rounded,
                                  color: AppColors.scColor.withOpacity(
                                    0.2,
                                  ),
                                  size: 30.w,
                                ),
                              ),
                              4.he(),
                              appText(
                                txt: '4.8',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w600,
                              ),
                              appText(
                                txt: 'Ratings',
                                size: AppConstants.verySmallText,
                                color: AppColors.hintColor,
                                fw: FontWeight.w600,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 42.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.r),
                                    bottomRight: Radius.circular(15.r),
                                  ),
                                ),
                                child: Icon(
                                  Icons.people_outline_sharp,
                                  color: AppColors.primaryColor.withOpacity(
                                    0.2,
                                  ),
                                  size: 30.w,
                                ),
                              ),
                              4.he(),
                              appText(
                                txt: '10+',
                                size: AppConstants.mediumText,
                                fw: FontWeight.w600,
                              ),
                              appText(
                                txt: 'Patients',
                                size: AppConstants.verySmallText,
                                color: AppColors.hintColor,
                                fw: FontWeight.w600,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    25.he(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                          txt: 'About me',
                          size: AppConstants.largeText,
                          fw: FontWeight.w700,
                        ),
                        5.he(),
                        appText(
                          txt: bloc.doctorInfo!['aboutMe'],
                          size: AppConstants.mediumText,
                          align: TextAlign.start,
                          color: AppColors.hintColor,
                        ),
                        30.he(),
                        appText(
                          txt: 'Working Time',
                          size: AppConstants.largeText,
                          fw: FontWeight.w700,
                        ),
                        5.he(),
                        appText(
                          txt:
                              'Off Days: ${bloc.doctorInfo!['offDays'].map((e) => e.toString()).join(' - ')} , ${bloc.doctorInfo!['fromTime']} - ${bloc.doctorInfo!['toTime']}',
                          size: AppConstants.mediumText,
                          align: TextAlign.start,
                          color: AppColors.hintColor,
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class DoctorLocationPage extends StatefulWidget {
  const DoctorLocationPage({super.key});

  @override
  State<DoctorLocationPage> createState() => _DoctorLocationPageState();
}

class _DoctorLocationPageState extends State<DoctorLocationPage> {
  late final CameraPosition _kGooglePlex;
  GoogleMapController? gmc;

  @override
  void initState() {
    _kGooglePlex = const CameraPosition(
      target: LatLng(30.033333, 31.233334),
      zoom: 16.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorInfoBloc, DoctorInfoState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<DoctorInfoBloc>(context);
        return Scaffold(
          body: bloc.doctorInfo! == null
              ? const SpinKitChasingDots(color: AppColors.scColor)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                      txt: 'Practice Place',
                      size: AppConstants.largeText,
                      align: TextAlign.start,
                      fw: FontWeight.w600,
                    ),
                    appText(
                      txt: bloc.doctorInfo!['address'],
                      size: AppConstants.mediumText,
                      align: TextAlign.start,
                      color: AppColors.hintColor,
                    ),
                    10.he(),
                    appText(
                      txt: 'Location Map',
                      size: AppConstants.largeText,
                      align: TextAlign.start,
                      fw: FontWeight.w600,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Container(
                        height: 255.h,
                        width: double.infinity,
                        color: AppColors.whiteColor,
                        // ignore: unnecessary_null_comparison
                        child: _kGooglePlex == null
                            ? const Center(
                                child: CustomProgressIndicator(),
                              )
                            : GoogleMap(
                                compassEnabled: false,
                                scrollGesturesEnabled: true,
                                zoomGesturesEnabled: true,
                                mapToolbarEnabled: false,
                                zoomControlsEnabled: false,
                                tiltGesturesEnabled: false,
                                mapType: MapType.normal,
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('123'),
                                    infoWindow: InfoWindow(
                                      title: bloc.doctorInfo!['address'],
                                    ),
                                    position: bloc.doctorInfo!['addressDetails']
                                            .isEmpty
                                        ? const LatLng(30.033333, 31.233334)
                                        : LatLng(
                                            double.parse(bloc.doctorInfo![
                                                'addressDetails']['lat']),
                                            double.parse(bloc.doctorInfo![
                                                'addressDetails']['long']),
                                          ),
                                  )
                                },
                                initialCameraPosition: bloc
                                        .doctorInfo!['addressDetails'].isEmpty
                                    ? _kGooglePlex
                                    : CameraPosition(
                                        target: LatLng(
                                          double.parse(
                                              bloc.doctorInfo!['addressDetails']
                                                  ['lat']),
                                          double.parse(
                                              bloc.doctorInfo!['addressDetails']
                                                  ['long']),
                                        ),
                                        zoom: 18,
                                      ),
                                onMapCreated: (GoogleMapController controller) {
                                  gmc = controller;
                                }),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}

// class DoctorReviewPage extends StatelessWidget {
//   const DoctorReviewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(vertical: 5.h),
//             child: Card(
//               elevation: 0,
//               color: AppColors.whiteColor,
//               child: Padding(
//                 padding:
//                     EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           AppConstants.patientReview,
//                         ),
//                         10.wd(),
//                         Expanded(
//                             child: appText(
//                           txt: 'Noha Ahmed',
//                           size: AppConstants.mediumText,
//                           align: TextAlign.start,
//                           fw: FontWeight.w600,
//                         )),
//                         appText(
//                             txt: 'Today',
//                             size: AppConstants.smallText,
//                             align: TextAlign.start,
//                             fw: FontWeight.w500,
//                             color: AppColors.hintColor)
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         35.wd(),
//                         RatingBar(
//                           initialRating: 3.5,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemSize: 25.w,
//                           tapOnlyMode: true,
//                           glow: false,
//                           ignoreGestures: true,
//                           ratingWidget: RatingWidget(
//                             full: Icon(
//                               Icons.star_rate_rounded,
//                               color: Colors.yellow.shade600,
//                             ),
//                             half: Icon(
//                               Icons.star_half_rounded,
//                               color: Colors.yellow.shade600,
//                             ),
//                             empty: Icon(
//                               Icons.star_border_rounded,
//                               color: Colors.yellow.shade600,
//                             ),
//                           ),
//                           itemPadding:
//                               const EdgeInsets.symmetric(horizontal: 0),
//                           onRatingUpdate: (rating) {},
//                         ),
//                       ],
//                     ),
//                     appText(
//                       txt:
//                           'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctor,    thanks.',
//                       size: AppConstants.smallText,
//                       align: TextAlign.start,
//                       fw: FontWeight.w500,
//                       color: AppColors.hintColor,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
