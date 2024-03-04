import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    _controller = TabController(length: 3, vsync: this);
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
    return Scaffold(
      appBar: buildAppBar(title: 'Dr. Marwan Nasar', context: context),
      body: Background(
        child: Column(
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
                    Image.asset(
                      AppConstants.doctorProfile,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              txt: 'Dr. Marwan Nasar',
                              size: AppConstants.largeText,
                              fw: FontWeight.w800,
                            ),
                            appText(
                              txt: 'General | Orthopedic Surgeon',
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
                                  txt: '4.8 (4,279 reviews)',
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
                    SvgPicture.asset(
                      AppConstants.messageIcon,
                    )
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
                appText(
                  txt: 'Reveiws',
                  size: AppConstants.mediumText,
                  fw: FontWeight.w700,
                  color: _controller.index == 2
                      ? AppColors.scColor
                      : AppColors.hintColor,
                ),
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
                DoctorReviewPage(),
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
  }
}

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      txt: '10 Yrs',
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
                        color: AppColors.primaryColor.withOpacity(0.1),
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
                      txt: '1000+',
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
                txt:
                    'Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.',
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
                txt: 'Monday - Friday, 08.00 AM - 20.00 PM',
                size: AppConstants.mediumText,
                align: TextAlign.start,
                color: AppColors.hintColor,
              ),
            ],
          ),
        ],
      ),
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(
            txt: 'Practice Place',
            size: AppConstants.largeText,
            align: TextAlign.start,
            fw: FontWeight.w600,
          ),
          appText(
            txt: 'Egypt, Cairo',
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
                      mapType: MapType.terrain,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        gmc = controller;
                      }),
            ),
          )
        ],
      ),
    );
  }
}

class DoctorReviewPage extends StatelessWidget {
  const DoctorReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Card(
              elevation: 0,
              color: AppColors.whiteColor,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppConstants.patientReview,
                        ),
                        10.wd(),
                        Expanded(
                            child: appText(
                          txt: 'Noha Ahmed',
                          size: AppConstants.mediumText,
                          align: TextAlign.start,
                          fw: FontWeight.w600,
                        )),
                        appText(
                            txt: 'Today',
                            size: AppConstants.smallText,
                            align: TextAlign.start,
                            fw: FontWeight.w500,
                            color: AppColors.hintColor)
                      ],
                    ),
                    Row(
                      children: [
                        35.wd(),
                        RatingBar(
                          initialRating: 3.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25.w,
                          tapOnlyMode: true,
                          glow: false,
                          ignoreGestures: true,
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow.shade600,
                            ),
                            half: Icon(
                              Icons.star_half_rounded,
                              color: Colors.yellow.shade600,
                            ),
                            empty: Icon(
                              Icons.star_border_rounded,
                              color: Colors.yellow.shade600,
                            ),
                          ),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    appText(
                      txt:
                          'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctor,    thanks.',
                      size: AppConstants.smallText,
                      align: TextAlign.start,
                      fw: FontWeight.w500,
                      color: AppColors.hintColor,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
