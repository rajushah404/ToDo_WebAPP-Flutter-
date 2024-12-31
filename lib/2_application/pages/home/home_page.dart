import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:web_demo/2_application/core/page_config.dart';
import 'package:web_demo/2_application/pages/dashboard/dashboard_page.dart';
import 'package:web_demo/2_application/pages/overview/overview_page.dart';
import 'package:web_demo/2_application/pages/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required String tab})
      : index = tabs.indexWhere((e) => e.name == tab);

  final int index;

  static const pageConfig = PageConfig(
    icon: Icons.home_mini_rounded,
    name: 'home',
  );

  // List of all tabs to bs displayed on our navigation bar
  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
    SettingsPage.pageConfig
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs
      .map(
        (page) => NavigationDestination(
          icon: Icon(page.icon),
          label: page.name,
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
                key: Key('primary-nagivation-medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                    // trailing: IconButton(
                    //     onPressed: () =>
                    //         context.goNamed(SettingsPage.pageConfig.name),
                    //     icon: Icon(SettingsPage.pageConfig.icon)),
                    onDestinationSelected: (index) =>
                        _tapOnNavigationDestination(context, index),
                    selectedIndex: widget.index,
                    selectedIconTheme:
                        IconThemeData(color: theme.colorScheme.onSurface),
                    selectedLabelTextStyle:
                        TextStyle(color: theme.colorScheme.onSurface),
                    destinations: destinations
                        .map((element) =>
                            AdaptiveScaffold.toRailDestination(element))
                        .toList()))
          }),
          bottomNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: Key('botton-nagivatoin-small'),
              builder: (context) =>
                  AdaptiveScaffold.standardBottomNavigationBar(
                      destinations: destinations,
                      onDestinationSelected: (value) =>
                          _tapOnNavigationDestination(context, value),
                      currentIndex: widget.index),
            )
          }),
          body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.smallAndUp: SlotLayout.from(
              key: Key('primary-body'),
              builder: (_) => HomePage.tabs[widget.index].child,
            )
          }),
          secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: Key('secondary-body'),
              builder: AdaptiveScaffold.emptyBuilder,
            )
          }),
        ),
      ),
    );
  }

  void _tapOnNavigationDestination(BuildContext context, int index) =>
      context.goNamed(HomePage.pageConfig.name,
          pathParameters: {'tab': HomePage.tabs[index].name});
}
