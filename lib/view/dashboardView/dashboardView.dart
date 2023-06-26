// ignore_for_file: camel_case_types

import 'package:barber_app/data/response/status.dart';
import 'package:barber_app/models/dashboard/dashboardModel.dart';
import 'package:barber_app/res/colors/app_color.dart';
import 'package:barber_app/res/components/internet_exceptions_widget.dart';
import 'package:barber_app/res/constants/constants.dart';
import 'package:barber_app/view_models/controller/dashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final dashboardController = Get.put(DashboardController());
  final List<String> servicesIcons = [
    'assets/icons/washcut.png',
    'assets/icons/shave.png',
    'assets/icons/cut.png',
    'assets/icons/headmassage.png',
    'assets/icons/scisorcut.png',
    'assets/icons/wetshave.png',
  ];
  @override
  void initState() {
    super.initState();
    dashboardController.getDashboardData();
    dashboardController.firstVisit.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        body: Obx(() {
          switch (dashboardController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ));
            case Status.ERROR:
              return Center(child: InterNetExceptionWidget(
                onPress: () {
                  dashboardController.getDashboardData();
                },
              ));
            case Status.COMPLETED:
              return SizedBox(
                height: Constants.getHeight(context),
                width: Constants.getWidth(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LoginRow(),
                        const SizedBox(
                          height: 18,
                        ),
                        AddressWidget(
                            address:
                                '${dashboardController.dashboardData.value.data![1].id} St, ${dashboardController.dashboardData.value.data![1].city}'),
                        const SizedBox(
                          height: 18,
                        ),
                        const Divider(
                          color: AppColor.dark2Color,
                        ),
                        const DataRow(),
                        const Divider(
                          color: AppColor.dark2Color,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const expandGrid(title: 'Our Services'),
                        const SizedBox(
                          height: 13,
                        ),
                        servicesGrid(
                            data: dashboardController.dashboardData.value,
                            icons: servicesIcons),
                        const SizedBox(
                          height: 50,
                        ),
                        const expandGrid(title: 'Our Barbers'),
                        const SizedBox(
                          height: 13,
                        ),
                        barbergrid(
                            data: dashboardController.dashboardData.value),
                        const SizedBox(
                          height: 50,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Timing',
                              style: TextStyle(
                                  fontFamily: 'playfair',
                                  fontSize: 18,
                                  color: AppColor.dark4Color,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const timingWidget(day: 'MON', time: '9am - 10pm'),
                        const SizedBox(
                          height: 2,
                        ),
                        const timingWidget(day: 'TUE', time: 'Closed'),
                        const SizedBox(
                          height: 2,
                        ),
                        const timingWidget(day: 'WED', time: '9am - 10pm'),
                        const SizedBox(
                          height: 2,
                        ),
                        const timingWidget(day: 'THU', time: '9am - 10pm'),
                        const SizedBox(
                          height: 2,
                        ),
                        const timingWidget(day: 'FRI', time: '9am - 10pm'),
                        const SizedBox(
                          height: 2,
                        ),
                        const timingWidget(day: 'SAT', time: '9am - 10pm'),
                        const SizedBox(
                          height: 2,
                        ),
                        const timingWidget(day: 'SUN', time: '9am - 10pm'),
                        const SizedBox(
                          height: 50,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Gallery',
                              style: TextStyle(
                                  fontFamily: 'playfair',
                                  fontSize: 18,
                                  color: AppColor.dark4Color,
                                  fontWeight: FontWeight.w800)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GalleryWidget(
                            data: dashboardController.dashboardData.value),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        }),
      ),
    );
  }
}

class GalleryWidget extends StatelessWidget {
  final dashboardModel data;
  const GalleryWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 140,
                width: 225,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    data.data![index].allImages!.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class timingWidget extends StatelessWidget {
  final String day, time;
  const timingWidget({
    super.key,
    required this.day,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColor.cardBGColor,
          borderRadius: BorderRadius.only(
              bottomLeft:
                  day == 'SUN' ? const Radius.circular(12) : Radius.zero,
              bottomRight:
                  day == 'SUN' ? const Radius.circular(12) : Radius.zero,
              topLeft: day == 'MON' ? const Radius.circular(12) : Radius.zero,
              topRight:
                  day == 'MON' ? const Radius.circular(12) : Radius.zero)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            day,
            style: const TextStyle(
                fontFamily: 'gordita',
                fontWeight: FontWeight.w500,
                color: AppColor.whiteColor,
                fontSize: 14),
          ),
          const SizedBox(
            width: 90,
          ),
          Text(
            time,
            style: TextStyle(
                fontFamily: 'gordita',
                fontWeight: FontWeight.w400,
                color: time == 'Closed'
                    ? AppColor.dangerColor
                    : AppColor.successColor,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}

class barbergrid extends StatelessWidget {
  final dashboardModel data;
  const barbergrid({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            childAspectRatio: 2 / 2.15,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemCount: 6,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            decoration: const BoxDecoration(
              color: AppColor.cardBGColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70.0),
                topRight: Radius.circular(7.0),
                bottomLeft: Radius.circular(7.0),
                bottomRight: Radius.circular(7.0),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(
                          index == data.data!.length
                              ? data.data![2].name!.split(' ')[0].toString()
                              : data.data![index].name!
                                  .split(' ')[0]
                                  .toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontFamily: 'gordita',
                              fontWeight: FontWeight.w500,
                              color: AppColor.whiteColor,
                              fontSize: 14),
                        ),
                        Text(
                          index == data.data!.length
                              ? data.data![2].city!.toString()
                              : data.data![index].city!.toString(),
                          style: const TextStyle(
                              fontFamily: 'gordita',
                              fontWeight: FontWeight.w400,
                              color: AppColor.dark3Color,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 20,
                  right: 5,
                  child: SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.primaryColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '4.0',
                          style: TextStyle(
                              fontFamily: 'gordita',
                              fontWeight: FontWeight.normal,
                              color: AppColor.dark3Color,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColor.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/icons/mandp2.jpg'),
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class servicesGrid extends StatelessWidget {
  final dashboardModel data;
  final List<String> icons;
  const servicesGrid({
    super.key,
    required this.data,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 1.4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemCount: 6,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.cardBGColor,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.secondaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            icons[index],
                            height: 24,
                          ),
                        ),
                      ),
                      Container(
                        width: 88,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 48, 44, 38),
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(8.0), // Rounded top-left corner
                            topRight: Radius.zero, // Rounded top-right corner
                            bottomLeft: Radius.circular(
                                8.0), // Sharp bottom-left corner
                            bottomRight:
                                Radius.zero, // Sharp bottom-right corner
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '\$10',
                                style: TextStyle(
                                    fontFamily: 'gordita',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryColor,
                                    fontSize: 14),
                              ),
                              Icon(
                                Icons.timer_outlined,
                                color: AppColor.dark3Color,
                                size: 12,
                              ),
                              Text(
                                '30 m',
                                style: TextStyle(
                                    fontFamily: 'gordita',
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.dark3Color,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                      index == data.data!.length
                          ? data.data![2].name!.split(' ')[0].toString()
                          : data.data![index].name!.split(' ')[0].toString(),
                      style: const TextStyle(
                          fontFamily: 'gordita',
                          fontSize: 14,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          );
        });
  }
}

class expandGrid extends StatelessWidget {
  final String title;

  const expandGrid({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontFamily: 'playfair',
                fontSize: 18,
                color: AppColor.dark4Color,
                fontWeight: FontWeight.w600)),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View All',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'gordita',
                fontSize: 12,
                color: AppColor.dark4Color),
          ),
        ),
      ],
    );
  }
}

class DataRow extends StatelessWidget {
  const DataRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: SizedBox(
      height: 58,
      width: 344.w,
      child: const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('20',
                    style: TextStyle(
                        fontFamily: 'playfair',
                        fontSize: 18,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600)),
                Text(
                  'Team Members',
                  style: TextStyle(
                      fontFamily: 'gordita',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.dark3Color),
                ),
              ],
            ),
          ),
          VerticalDivider(
            color: AppColor.dark2Color, //color of divider
            width: 5, //width space of divider
            thickness: 1, //thickness of divier line
            indent: 5, //Spacing at the top of divider.
            endIndent: 5, //Spacing at the bottom of divider.
          ),
          Expanded(
            child: Column(
              children: [
                Text('500',
                    style: TextStyle(
                        fontFamily: 'playfair',
                        fontSize: 18,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600)),
                Text(
                  'Happy Clients',
                  style: TextStyle(
                      fontFamily: 'gordita',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.dark3Color),
                ),
              ],
            ),
          ),
          VerticalDivider(
            color: AppColor.dark2Color, //color of divider
            width: 5, //width space of divider
            thickness: 1, //thickness of divier line
            indent: 5, //Spacing at the top of divider.
            endIndent: 5, //Spacing at the bottom of divider.
          ),
          Expanded(
            child: Column(
              children: [
                Text('5+',
                    style: TextStyle(
                        fontFamily: 'playfair',
                        fontSize: 18,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600)),
                Text(
                  'Years Experience',
                  style: TextStyle(
                      fontFamily: 'gordita',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.dark3Color),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class AddressWidget extends StatelessWidget {
  final String address;
  const AddressWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 104,
          width: 106,
          decoration: BoxDecoration(
              color: AppColor.cardBGColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColor.dark2Color, width: 1)),
          child: Image.asset('assets/icons/Frameappicon.png'),
        ),
        SizedBox(
          width: 15.w,
        ),
        SizedBox(
          height: 99,
          width: 184.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Haircuts Beards',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'playfair',
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColor.dark3Color,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                        fontFamily: 'gordita',
                        color: AppColor.dark3Color,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.call_outlined,
                    color: AppColor.dark3Color,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '+44258348928904',
                    style: TextStyle(
                        fontFamily: 'gordita',
                        color: AppColor.dark3Color,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class LoginRow extends StatelessWidget {
  const LoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.cardBGColor),
            child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  'assets/icons/login.png',
                  height: 16,
                  width: 16,
                ))),
        const SizedBox(
          width: 15,
        ),
        const Text(
          'Log In',
          style: TextStyle(
              fontFamily: 'playfair',
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        )
      ],
    );
  }
}
