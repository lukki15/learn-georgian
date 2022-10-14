import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/view/home_screen.dart';
import '../features/playlists/view/playlist_home_screen.dart';

import 'views/root_layout.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    route: '/',
  ),
  NavigationDestination(
    label: 'Writing',
    icon: Icon(Icons.history_edu),
    route: '/writing',
  ),
  NavigationDestination(
    label: 'Vocabulary',
    icon: Icon(Icons.chat_bubble_outline),
    route: '/vocabulary',
  ),
  NavigationDestination(
    label: 'Chat',
    icon: Icon(Icons.forum_outlined),
    route: '/vocabulary',
  ),
  NavigationDestination(
    label: 'Account',
    icon: Icon(Icons.person),
    route: '/account',
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
    // // HomeScreen
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: HomeScreen(),
        ),
      ),
    ),

    GoRoute(
      path: '/writing',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 1,
          child: PlaylistHomeScreen(),
        ),
      ),
      // routes: [
      //   GoRoute(
      //     path: ':pid',
      //     pageBuilder: (context, state) => MaterialPage<void>(
      //       key: state.pageKey,
      //       child: RootLayout(
      //         key: _scaffoldKey,
      //         currentIndex: 1,
      //         child: PlaylistScreen(
      //           playlist: playlistsProvider.getPlaylist(state.params['pid']!)!,
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    ),

    // // ArtistHomeScreen
    // GoRoute(
    //   path: '/artists',
    //   pageBuilder: (context, state) => const MaterialPage<void>(
    //     key: _pageKey,
    //     child: RootLayout(
    //       key: _scaffoldKey,
    //       currentIndex: 2,
    //       child: ArtistsScreen(),
    //     ),
    //   ),
    //   routes: [
    //     GoRoute(
    //       path: ':aid',
    //       pageBuilder: (context, state) => MaterialPage<void>(
    //         key: state.pageKey,
    //         child: RootLayout(
    //           key: _scaffoldKey,
    //           currentIndex: 2,
    //           child: ArtistScreen(
    //             artist: artistsProvider.getArtist(state.params['aid']!)!,
    //           ),
    //         ),
    //       ),
    //       // builder: (context, state) => ArtistScreen(
    //       //   id: state.params['aid']!,
    //       // ),
    //     ),
    //   ],
    // ),
    // for (final route in destinations.skip(3))
    //   GoRoute(
    //     path: route.route,
    //     pageBuilder: (context, state) => MaterialPage<void>(
    //       key: _pageKey,
    //       child: RootLayout(
    //         key: _scaffoldKey,
    //         currentIndex: destinations.indexOf(route),
    //         child: const SizedBox(),
    //       ),
    //     ),
    //   ),
  ],
);
