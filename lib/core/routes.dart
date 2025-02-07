import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/2_application/pages/dashboard/dashboard_page.dart';
import 'package:web_demo/2_application/pages/details_pages/todo_detail_page.dart';
import 'package:web_demo/2_application/pages/home/home_page.dart';
import 'package:web_demo/2_application/pages/overview/overview_page.dart';
import 'package:web_demo/2_application/pages/settings/settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const String _basePath = '/home';
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '$_basePath/${DashboardPage.pageConfig.name}',
  // observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      name: SettingsPage.pageConfig.name,
      path: '$_basePath/${SettingsPage.pageConfig.name}',
      builder: (context, state) => SettingsPage(),
    ),
    ShellRoute(
      routes: [
        GoRoute(
            name: HomePage.pageConfig.name,
            path: '$_basePath/:tab',
            builder: (context, state) => HomePage(
                key: state.pageKey,
                tab: state.pathParameters['tab'] ?? 'dashboard')),
      ],
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
    ),
    GoRoute(
      name: TodoDetailPage.pageConfig.name,
      path: '$_basePath/overview/:collectionId',
      builder: (context, state) {
        final collectionId = state.pathParameters['collectionId'];

        return Scaffold(
          appBar: AppBar(
            title: Text("Details"),
            leading: BackButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.goNamed(
                    HomePage.pageConfig.name,
                    pathParameters: {
                      'tab': OverviewPage.pageConfig.name,
                    },
                  );
                }
              },
            ),
          ),
          body: ToDoDetailsPageProvider(
            collectionId: CollectionId.fromUniqueString(
              // state.pathParameters['collectionId'] ?? '',
              collectionId ?? '',
            ),
          ),
        );
      },
    )
  ],
);
