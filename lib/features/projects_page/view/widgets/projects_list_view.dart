import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/features/projects_page/data/models/projects_model.dart';
import 'package:tech_tak/features/projects_page/view/widgets/project_item.dart';

class ProjectsListView extends StatefulWidget {
  const ProjectsListView({super.key});

  @override
  State<ProjectsListView> createState() => _ProjectsListViewState();
}

class _ProjectsListViewState extends State<ProjectsListView> {
  List<ProjectsModel> _projectsData = [];
  bool _isLoading = true;

  Future<void> _fetchProjects() async {
    setState(() {
      _isLoading = true;
    });

    final projects = await fetchProjectsData();

    setState(() {
      _isLoading = false;
      _projectsData = projects;
    });
  }

  Future<List<ProjectsModel>> fetchProjectsData() async {
    try {
      final projectResponse =
          await Supabase.instance.client.from('tech_tak_projects').select();
      return (projectResponse as List)
          .map((project) => ProjectsModel.fromJson(project))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    if (_isLoading) {
      return Column(
        children: [
          SizedBox(
            height: RM.data.mapSize(mobile: 150, tablet: 150, desktop: 200),
          ),
          const Center(
              child: CircularProgressIndicator(
            color: ColorsBox.primaryColor,
          )),
        ],
      );
    }

    switch (RM.data.deviceType) {
      case DeviceTypeView.mobile:
        return _ProjectsListViewMobile(projects: _projectsData);
      case DeviceTypeView.tablet:
        return _ProjectsGridViewTablet(projects: _projectsData);
      case DeviceTypeView.desktop:
        return _ProjectsGridViewWeb(projects: _projectsData);
      default:
        return _ProjectsGridViewWeb(projects: _projectsData);
    }
  }
}

class _ProjectsGridViewWeb extends StatelessWidget {
  final List<ProjectsModel> projects;

  const _ProjectsGridViewWeb({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        primary: false, // Avoid conflict with outer scrollable widgets
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectItem(project: projects[index]);
        },
      ),
    );
  }
}

class _ProjectsListViewMobile extends StatelessWidget {
  final List<ProjectsModel> projects;

  const _ProjectsListViewMobile({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView.builder(
        primary: false, // Avoid conflict with outer scrollable widgets
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ProjectItem(project: projects[index]),
          );
        },
      ),
    );
  }
}

class _ProjectsGridViewTablet extends StatelessWidget {
  final List<ProjectsModel> projects;

  const _ProjectsGridViewTablet({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        primary: false, // Avoid conflict with outer scrollable widgets
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectItem(project: projects[index]);
        },
      ),
    );
  }
}
