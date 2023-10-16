import 'package:audio_player/models/playlist_model.dart';
import 'package:audio_player/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  const PlaylistCard({required this.playlist, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColor.primaryColor.withOpacity(0.6),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(playlist.coverUrl,
                height: 50, width: 50, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist.title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                Text(
                  "${playlist.songs.length} songs",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {
                Get.toNamed('/playlist', arguments: playlist);
              },
              icon: const Icon(
                Icons.play_circle,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
