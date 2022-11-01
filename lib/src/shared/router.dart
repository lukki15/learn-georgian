import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/learn/view/learn_screen.dart';

import 'views/root_layout.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Learn',
    icon: Icon(Icons.school_outlined),
    route: '/',
  ),
  NavigationDestination(
    label: 'Practice',
    icon: Icon(Icons.insights_outlined),
    route: '/practice',
  ),
  NavigationDestination(
    label: 'Notification',
    icon: Icon(Icons.notifications_outlined),
    route: '/notification',
  ),
  NavigationDestination(
    label: 'Profile',
    icon: Icon(Icons.person_outline),
    route: '/profile',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: LearnScreen(),
        ),
      ),
    ),
    for (final route in destinations.skip(1))
      GoRoute(
        path: route.route,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: destinations.indexOf(route),
            child: const SizedBox(),
          ),
        ),
      ),
  ],
);
