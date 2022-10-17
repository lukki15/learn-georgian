import 'dart:math';

import 'package:flutter/material.dart';
import '../../../shared/classes/playlist.dart';
import '../../../shared/extensions.dart';
import '../../../shared/views/outlined_card.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      child: LayoutBuilder(
        builder: (context, dimens) => Row(
          children: [
            SizedBox(
              width: dimens.maxWidth * 0.4,
              child: Image.asset(
                playlist.cover.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playlist.title,
                              style: context.titleMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              playlist.description,
                              overflow: TextOverflow.ellipsis,
                              style: context.labelSmall,
                              maxLines: 3,
                            ),
                          ]),
                    ),
                    if (dimens.maxHeight > 100)
                      Row(
                        children: [
                          Text(
                            playlist.id,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: context.labelMedium,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
