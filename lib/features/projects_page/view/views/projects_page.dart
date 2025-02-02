import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tak/core/config/assets_box.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/home_page/view/widgets/logo_widget.dart';
import 'package:tech_tak/features/projects_page/view/widgets/projects_list_view.dart';
import 'package:tech_tak/features/projects_page/view/widgets/projects_title_widget.dart';

class ProjectsPage extends StatelessWidget {
  static String routeName = '/projects_page';
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Center(
              child: GestureDetector(
                  onTap: () => GoRouter.of(context).go('/'),
                  child: const LogoWidget())),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: ColorsBox.greyBody,
        body: Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: RM.data.deviceType == DeviceTypeView.desktop
                    ? const AssetImage(AssetsBox.backgroundWhite)
                    : const AssetImage(AssetsBox.backgroundMobileWhite),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: RM.data.deviceType == DeviceTypeView.mobile ||
                              RM.data.deviceType == DeviceTypeView.tablet
                          ? MediaQuery.of(context).size.height * 0.02
                          : MediaQuery.of(context).size.width * 0.01,
                      bottom:
                          RM.data.mapSize(mobile: 20, tablet: 20, desktop: 30)),
                  child: const ProjectsTitleWidget(),
                ),
                const Expanded(child: ProjectsListView()),
              ],
            ),
          ),
        ));
  }
}
