import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './artist_card.dart';

import '../../../shared/providers/playlists.dart';

class ArtistsScreen extends StatelessWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final artistsProvider = PlaylistsProvider();
    final playlists = artistsProvider.playlists;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        primary: false,
        appBar: AppBar(
          title: const Text('ARTISTS'),
          toolbarHeight: kToolbarHeight * 2,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(1, (constraints.maxWidth ~/ 400).toInt()),
            childAspectRatio: 2.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            final playlist = playlists[index];
            return GestureDetector(
              child: ArtistCard(
                playlist: playlist,
              ),
              onTap: () => GoRouter.of(context).go('/artists/${playlist.id}'),
            );
          },
        ),
      );
    });
  }
}
