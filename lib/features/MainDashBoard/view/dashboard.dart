
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wire_sense/common/utils/app_colors.dart';
import '../../../../../../common/widgets/app_shadow.dart';
import '../../../../../../common/widgets/plotdata.dart';
import '../../../../../../common/widgets/text_widgets.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_text_fields.dart';

/// Left side Dashboard drawer
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String selectedMenu = 'Dashboard';
  String selectedProperty = 'Conductivity';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 6,
          child: Drawer(
            backgroundColor: Colors.white70,
            shape: const RoundedRectangleBorder(),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          ImageRes.letterW,
                          fit: BoxFit.fill,
                          height: 50,
                          width: 50,
                        ),
                        const textcustomnormal(
                          text: "ireSense",
                          fontWeight: FontWeight.bold,
                          fontfamily: "Inter",
                          fontSize: 30,
                          color: Color(0xff2074F2),
                        )
                      ],
                    ),
                  ),
                ),
                dashLine(
                  height: 0.5,
                  color: Colors.grey.shade200,
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ListTile(
                    minLeadingWidth: 0,
                    dense: true,
                    leading: Icon(
                      Icons.dashboard,
                      color: selectedMenu == 'Dashboard'
                          ? Colors.white
                          : const Color(0xffA3AED0),
                      size: screenHeight * 0.03,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: selectedMenu == 'Dashboard'
                        ? const Color(0xff4318FF)
                        : Colors.white70,
                    title: Transform.translate(
                      offset: const Offset(-25, 0),
                      child: textcustomnormal(
                        text: 'Dashboard',
                        fontSize: 16,
                        fontfamily: "Inter",
                        fontWeight: FontWeight.w400,
                        color: selectedMenu == 'Dashboard'
                            ? Colors.white
                            : const Color(0xffA3AED0),
                      ),
                    ),
                    onTap: () {
                      // _key.currentState?.closeDrawer();
                      setState(() {
                        selectedMenu = 'Dashboard';
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ListTile(
                    minLeadingWidth: 0,
                    dense: true,
                    leading: Icon(
                      size: screenHeight * 0.03,
                      Icons.download,
                      color: selectedMenu == 'Download Report'
                          ? Colors.white
                          : const Color(0xffA3AED0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: selectedMenu == 'Download Report'
                        ? const Color(0xff562efd)
                        : Colors.white70,
                    title: textcustomnormal(
                      text: 'Download Report',
                      fontSize: 16,
                      fontfamily: "Inter",
                      fontWeight: FontWeight.w400,
                      color: selectedMenu == 'Download Report'
                          ? Colors.white
                          : const Color(0xffA3AED0),
                    ),
                    onTap: () {
                      // _key.currentState?.closeDrawer();
                      setState(() {
                        selectedMenu = 'Download Report';
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // Expanded(
        //     flex: 1,
        //     child: Container(
        //       padding: const EdgeInsets.all(8),
        //       alignment: Alignment.topCenter,
        //       height: screenHeight,
        //       color: Colors.white,
        //       child: IconButton(
        //           onPressed: () {
        //             _key.currentState?.openDrawer();
        //           },
        //           icon: const Icon(
        //             Icons.menu,
        //             color: Colors.black,
        //           )),
        //     )),
        Expanded(
          flex: 25,
          child: getContentWidget(selectedMenu),
        )
      ]),
    );
  }

  Widget getContentWidget(String menu) {
    switch (menu) {
      case 'Download Report':
        return const Center(child: Text('Download Report'));
      case 'Dashboard':
        return const Center(child: MainDashBoard());
      default:
        return const Center(child: MainDashBoard());
    }
  }
}

///DashBoard right side section
class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  List<CastingTemp> temperatureData = [
    CastingTemp('Q1', 3.0),
    CastingTemp('Q2', 4.0),
    CastingTemp('Q3', 2.0),
    CastingTemp('Q4', 3.0),
  ];
  late TextEditingController searchFieldController;
  bool _switchValue = false;
  String selectedProperty = 'Conductivity';
  @override
  void initState() {
    searchFieldController = TextEditingController();
    super.initState();
  }
 List<String> getPropertyAndItsValue(String selProp){
    List<String> ans=[];
    switch (selProp) {
      case 'Conductivity':
        return  ['65 s/m','Conductivity'];
      case 'UTS':
        return  ['30 N/m²','UTS'];
      case 'Elongation':
        return  ['20 %','Elongation'];
      default:
        return  ['Error','No case Found'];
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xfff4f7fe),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02, vertical: screenHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const text14normal(
                  fontfamily: "Inter",
                  fontWeight: FontWeight.w400,
                  text: "Hi User,",
                  color: AppColors.dashBoardSecondaryTextColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const text24normal(
                      fontfamily: "Inter",
                      fontWeight: FontWeight.w600,
                      text: "Welcome to Wiresense!",
                      color: AppColors.dashBoardPrimaryTextColor,
                    ),
                    //todo - have a validation here
                    textLoginBoxWithDimensions(
                      width: screenWidth * 0.25,
                      hintText: "Search",
                      icon: Icons.search_rounded,
                      controller: searchFieldController,
                      keyboardType: TextInputType.number,
                      func: (value) {},
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                // todo - to check logic which container is selected
                ///Property Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    propertyContainer(
                      propertyName: 'CONDUCTIVITY',
                      propertyValue: '60.01 s/m',
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      icon: Icons.trending_up,
                      isSelected: selectedProperty=='Conductivity', click: () {
                        setState(() {
                          selectedProperty='Conductivity';
                        });
                    },
                    ),
                    SizedBox(
                      width: screenWidth * 0.015,
                    ),
                    propertyContainer(
                      propertyName: 'UTS',
                      propertyValue: '30 N/m²',
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      icon: Icons.trending_down, isSelected: selectedProperty=='UTS', click: () {
                        setState(() {
                          selectedProperty='UTS';
                        });
                        },
                    ),
                    SizedBox(
                      width: screenWidth * 0.015,
                    ),
                    propertyContainer(
                      propertyName: 'ELONGATION',
                      propertyValue: '50 %',
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      icon: Icons.trending_up, isSelected: selectedProperty=='Elongation', click: () {
                        setState(() {
                          selectedProperty='Elongation';
                        });
                    },
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),

                ///Selected Property and Alerts Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: screenHeight * 0.48,
                      width: screenWidth * 0.50,
                      decoration: appBoxDecoration(
                          radius: 20,
                          borderWidth: 0.0,
                          borderColor: Colors.transparent,
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textcustomnormal(
                            fontSize: 30,
                            color: Colors.black,
                            fontfamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            text: getPropertyAndItsValue(selectedProperty).first,
                          ),
                          Row(
                            children: [
                              text14normal(
                                fontWeight: FontWeight.w400,
                                fontfamily: "Poppins",
                                color: AppColors.dashBoardSecondaryTextColor,
                                text: getPropertyAndItsValue(selectedProperty).last,
                              ),
                              const Icon(
                                Icons.arrow_drop_up_sharp,
                                color: Colors.green,
                              ),
                              const textcustomnormal(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontfamily: "Poppins",
                                color: Colors.green,
                                text: '+2.45 %',
                              )
                            ],
                          ),
                          //todo - to make a real time chart here...
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              ImageRes.chartDemo,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),

                    ///Alert Container
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: screenHeight * 0.48,
                      width: screenWidth * 0.25,
                      decoration: appBoxDecoration(
                          radius: 20,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const textcustomnormal(
                                fontSize: 22,
                                text: "Alerts",
                                color: Color(0xff1B2559),
                                fontfamily: "Inter",
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: CupertinoSwitch(
                                    value: _switchValue,
                                    activeColor: Colors.deepPurpleAccent,
                                    onChanged: (value) {
                                      setState(() {
                                        _switchValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.flash_on,
                                    color: Colors.grey.shade500),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    text14normal(
                                      text: "Conductivity",
                                      fontfamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color:
                                          AppColors.dashBoardPrimaryTextColor,
                                    ),
                                    textcustomnormal(
                                      fontSize: 12,
                                      text: "Increase Temperature by 20K",
                                      fontfamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: appBoxDecoration(
                                      radius: 5,
                                      color:
                                          Colors.greenAccent.withOpacity(0.2),
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0),
                                  child: Center(
                                    child: text14normal(
                                      text: '+0.500K',
                                      fontfamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.greenAccent.shade400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.fitness_center,
                                    color: Colors.grey.shade500),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    text14normal(
                                      text: "UTS",
                                      fontfamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color:
                                          AppColors.dashBoardPrimaryTextColor,
                                    ),
                                    textcustomnormal(
                                      fontSize: 12,
                                      text: "Decrease Pressure by 3 ATM",
                                      fontfamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: appBoxDecoration(
                                      radius: 5,
                                      color: Colors.redAccent.withOpacity(0.2),
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0),
                                  child: Center(
                                    child: text14normal(
                                      text: '-0.50 N',
                                      fontfamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.redAccent.shade400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.expand, color: Colors.grey.shade500),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    text14normal(
                                      text: "Elongation",
                                      fontfamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color:
                                          AppColors.dashBoardPrimaryTextColor,
                                    ),
                                    textcustomnormal(
                                      fontSize: 12,
                                      text: "No change required",
                                      fontfamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.greenAccent,
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: appBoxDecoration(
                                      radius: 5,
                                      color:
                                          Colors.greenAccent.withOpacity(0.2),
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0),
                                  child: Center(
                                    child: text14normal(
                                      text: '+0.001%',
                                      fontfamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.greenAccent.shade400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.065,
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: const text16normal(
                                text: "View all ->",
                                fontfamily: "Inter",
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainThemeColor,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),

                /// Plots Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenHeight * 0.48,
                      width: screenWidth * 0.23,
                      decoration: appBoxDecoration(
                          radius: 20,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          const textcustomnormal(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontfamily: "Inter",
                            color: AppColors.dashBoardSecondaryTextColor,
                            text: "Casting Temperature",
                          ),
                          // SizedBox(height: screenHeight*0.005,),
                          const textcustomnormal(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontfamily: "Poppins",
                            color: AppColors.dashBoardPrimaryTextColor,
                            text: "423 K",
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: appBoxDecoration(
                                radius: 5,
                                color: Colors.greenAccent.withOpacity(0.2),
                                borderColor: Colors.transparent,
                                borderWidth: 0.0),
                            child: Center(
                              child: textcustomnormal(
                                fontSize: 12,
                                text: '+45K',
                                fontfamily: "Inter",
                                fontWeight: FontWeight.w500,
                                color: Colors.greenAccent.shade400,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.07,),
                          Container(
                            width: double.maxFinite,
                            child: Image.asset(
                              'assets/images/demo_plot.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.48,
                      width: screenWidth * 0.23,
                      decoration: appBoxDecoration(
                          radius: 20,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          const textcustomnormal(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontfamily: "Inter",
                            color: AppColors.dashBoardSecondaryTextColor,
                            text: "Casting Pressure",
                          ),
                          // SizedBox(height: screenHeight*0.005,),
                          const textcustomnormal(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontfamily: "Poppins",
                            color: AppColors.dashBoardPrimaryTextColor,
                            text: "12 ATM",
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: appBoxDecoration(
                                radius: 5,
                                color: Colors.redAccent.withOpacity(0.2),
                                borderColor: Colors.transparent,
                                borderWidth: 0.0),
                            child: Center(
                              child: textcustomnormal(
                                fontSize: 12,
                                text: '-4 ATM',
                                fontfamily: "Inter",
                                fontWeight: FontWeight.w500,
                                color: Colors.redAccent.shade400,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.07,),
                          Container(
                            width: double.maxFinite,
                            child: Image.asset(
                              'assets/images/demo_plot02.png',
                              height: screenHeight*0.23,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),Container(
                      height: screenHeight * 0.48,
                      width: screenWidth * 0.23,
                      decoration: appBoxDecoration(
                          radius: 20,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          const textcustomnormal(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontfamily: "Inter",
                            color: AppColors.dashBoardSecondaryTextColor,
                            text: "Rolling Speed",
                          ),
                          // SizedBox(height: screenHeight*0.005,),
                          const textcustomnormal(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontfamily: "Poppins",
                            color: AppColors.dashBoardPrimaryTextColor,
                            text: "12 m/s",
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: appBoxDecoration(
                                radius: 5,
                                color: Colors.greenAccent.withOpacity(0.2),
                                borderColor: Colors.transparent,
                                borderWidth: 0.0),
                            child: Center(
                              child: textcustomnormal(
                                fontSize: 12,
                                text: '+3 m/s',
                                fontfamily: "Inter",
                                fontWeight: FontWeight.w500,
                                color: Colors.greenAccent.shade400,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.07,),
                          Container(
                            width: double.maxFinite,
                            child: Image.asset(
                              'assets/images/demo_plot.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget propertyContainer(
      {required String propertyName,
      required String propertyValue,
      required double screenHeight,
      required double screenWidth,
      required IconData icon,
      required  bool isSelected,
        required Function()? click
      }) {
    return isSelected?Container(
      width: screenWidth * 0.18,
      height: screenHeight * 0.15,
      padding: const EdgeInsets.all(20),
      decoration: appBoxDecorationWithGradient(
          color: AppColors.mainThemeColor,
          borderColor: Colors.transparent,
          borderWidth: 0.0,
          radius: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text20normal(
                  text: propertyName,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontfamily: "Poppins",
                ),
                const SizedBox(
                  height: 5,
                ),
                textcustomnormal(
                  fontSize: 22,
                  text: propertyValue,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontfamily: "Poppins",
                )
              ],
            ),
            Icon(
              icon,
              size: screenHeight * 0.05,
            )
          ],
        ),
      ),
    ):GestureDetector(
      onTap: click!,
      child: Container(
        width: screenWidth * 0.18,
        height: screenHeight * 0.15,
        padding: const EdgeInsets.all(20),
        decoration: appBoxDecoration(
            color: Colors.white,
            borderColor: Colors.transparent,
            borderWidth: 0.0,
            radius: 20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text20normal(
                    text: propertyName,
                    color: AppColors.dashBoardSecondaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontfamily: "Poppins",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  textcustomnormal(
                    fontSize: 22,
                    text: propertyValue,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontfamily: "Poppins",
                  )
                ],
              ),
              Icon(
                icon,
                size: screenHeight * 0.05,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget notSelectedPropertyContainer(
      {required String propertyName,
      required String propertyValue,
      required double screenHeight,
      required double screenWidth,
      required IconData icon}) {
    return Container(
      width: screenWidth * 0.18,
      height: screenHeight * 0.15,
      padding: const EdgeInsets.all(20),
      decoration: appBoxDecoration(
          color: Colors.white,
          borderColor: Colors.transparent,
          borderWidth: 0.0,
          radius: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text20normal(
                  text: propertyName,
                  color: AppColors.dashBoardSecondaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontfamily: "Poppins",
                ),
                const SizedBox(
                  height: 5,
                ),
                textcustomnormal(
                  fontSize: 22,
                  text: propertyValue,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontfamily: "Poppins",
                )
              ],
            ),
            Icon(
              icon,
              size: screenHeight * 0.05,
            )
          ],
        ),
      ),
    );
  }

  /// Code of Initial UI
// Widget _buildRealTimeProcessMonitor({
//   required String UTS,
//   required String Elongation,
//   required String Conductivity,
//   required double screenHeight,
//   required double screenWidth,
// }) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
//     decoration: BoxDecoration(
//       color: Colors.blue[50],
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 3,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Real-time Process Monitor',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blueAccent,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         'Manufacturing in progress',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                       ),
//                     ],
//                   ),
//                   documentsButtons(
//                       buttonText: "Stop Process",
//                       buttonColor: Colors.red.shade600,
//                       buttonTextColor: Colors.white,
//                       buttonIcon: Icons.pause,
//                       buttonBorderWidth: 0.0,
//                       iconColor: Colors.white,
//                       anyWayDoor: () {}),
//                 ],
//               ),
//               const SizedBox(height: 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildProcessDetail(
//                       'Target UTS', '$UTS Mpa', Icons.handyman),
//                   const SizedBox(width: 20,),
//                   _buildProcessDetail(
//                       'Target Elongation', '$Elongation %', Icons.straighten),
//                   const SizedBox(width: 20,),
//                   _buildProcessDetail(
//                       'Target Conductivity', '$Conductivity S/M', Icons.bolt),
//                   const SizedBox(width: 20,),
//                   _buildProcessDetail('Process Time', '03:45:30', Icons.timer),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 100,),
//         Expanded(
//           flex: 1,
//             child: Container(
//                 height: screenHeight*0.35,
//                 width: screenWidth*0.15,
//                 padding: const EdgeInsets.all(10),
//                 decoration: appBoxShadow(radius: 10,color: Colors.white),
//                 child: Image.asset('assets/images/unipol.png',fit: BoxFit.fill,)))
//
//       ],
//     ),
//
//   );
// }
//Widget _buildProcessDetail(String label, String value, IconData icon) {
//   return Column(
//     children: [
//       Icon(icon, color: Colors.blueAccent, size: 30),
//       const SizedBox(height: 5),
//       Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
//       const SizedBox(height: 5),
//       Text(value,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//     ],
//   );
// }
//
// Widget _buildMonitoringSection(double screenHeight, double screenWidth) {
//   return Container(
//     width: screenWidth * 0.7,
//     height: screenHeight * 0.65,
//     margin: const EdgeInsets.symmetric(horizontal: 20),
//     padding: const EdgeInsets.all(10),
//     child: GridView(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 20),
//       children: [
//         plot(screenHeight, screenWidth),
//         plot(screenHeight, screenWidth),
//         plot(screenHeight, screenWidth),
//         plot(screenHeight, screenWidth),
//         plot(screenHeight, screenWidth),
//         plot(screenHeight, screenWidth),
//       ],
//     ),
//   );
// }
//
// Widget _buildLiveAlerts(double screenHeight) {
//   return Container(
//     height: screenHeight * 0.65,
//     margin: const EdgeInsets.symmetric(horizontal: 20),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.3),
//           spreadRadius: 2,
//           blurRadius: 5,
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//           child: Text(
//             'Live Alerts',
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange),
//           ),
//         ),
//         Container(
//           height: screenHeight * 0.58,
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 _buildAlert(
//                     'Temperature increased by 5°C - Adjusting pressure',
//                     Colors.red),
//                 _buildAlert(
//                     'Speed optimization in progress,who cares what is in progress',
//                     Colors.blue),
//                 _buildAlert(
//                     'Parameters stabilized at target values, the value are typically 123',
//                     Colors.green),
//                 _buildAlert(
//                     'Parameters stabilized at target values, the value are typically 123',
//                     Colors.redAccent),
//                 _buildAlert(
//                     'Parameters stabilized at target values, the value are typically 123',
//                     Colors.redAccent),
//               ],
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
//
// Widget _buildAlert(String message, Color color) {
//   return Container(
//     margin: const EdgeInsets.only(bottom: 10),
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: color.withOpacity(0.1),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       children: [
//         Icon(Icons.info_outline, color: color, size: 20),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Text(
//             message,
//             style: TextStyle(color: color, fontSize: 14),
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildStats() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       _buildStatCard('Production Count', '1200', Colors.blue),
//       _buildStatCard('Avg. Temperature', '350°C', Colors.red),
//       _buildStatCard('Avg. Pressure', '2.5 atm', Colors.green),
//     ],
//   );
// }
//
// Widget _buildStatCard(String label, String value, Color color) {
//   return Container(
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       color: color.withOpacity(0.1),
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: Column(
//       children: [
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: color,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[700],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildCorrelationMatrix() {
//   return Container(
//     margin: const EdgeInsets.all(20),
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       color: Colors.grey[200],
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Correlation Matrix',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 20),
//         // Image.asset(
//         //   'assets/images/correlation_matrix.png',
//         //   // Replace with your image path
//         //   height: 200,
//         // ),
//       ],
//     ),
//   );
// }
}

/// Plot Data and Graphs
// Widget plot(double screenHeight, double screenWidth) {
//   return Container(
//     decoration: appBoxDecoration(
//         color: Colors.white,
//         borderColor: Colors.black12,
//         borderWidth: 1,
//         radius: 10),
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const text20normal(
//           text: 'Casting Temperature',
//           fontfamily: "Poppins",
//         ),
//         dashboardChart(castingTempData: temperatureData)
//       ],
//     ),
//   );
// }
//
// Widget dashboardChart({required List<CastingTemp> castingTempData}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//     height: 300,
//     child: SfCartesianChart(
//         primaryXAxis: const CategoryAxis(
//           majorGridLines: MajorGridLines(width: 0.0),
//         ),
//         primaryYAxis: const NumericAxis(
//           title: AxisTitle(text: "Temperature"),
//           minimum: 1,
//           maximum: 5,
//           interval: 1,
//           majorGridLines: MajorGridLines(width: 0.4),
//         ),
//         tooltipBehavior: TooltipBehavior(
//           enable: true,
//         ),
//         series: <CartesianSeries>[
//           // Renders line chart
//           LineSeries<CastingTemp, String>(
//               name: 'Temperature',
//               dataSource: castingTempData,
//               xValueMapper: (CastingTemp data, _) => data.quarter,
//               yValueMapper: (CastingTemp data, _) => data.temp)
//         ]),
//   );
// }
