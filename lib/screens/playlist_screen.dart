import 'package:audio_player/models/playlist_model.dart';
import 'package:audio_player/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Playlist playlist = Get.arguments;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade900.withOpacity(0.8),
            Colors.deepPurple.shade100.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Center(
              child: Text(
            "Playlist",
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                PlayListInfoFormation(playlist: playlist),
                const PlayOrShufflesSwitch(),
                PlayListSongs(playlist: playlist),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayListInfoFormation extends StatelessWidget {
  final Playlist playlist;
  const PlayListInfoFormation({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            playlist.coverUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.6,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          playlist.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class PlayOrShufflesSwitch extends StatefulWidget {
  const PlayOrShufflesSwitch({super.key});

  @override
  State<PlayOrShufflesSwitch> createState() => _PlayOrShufflesSwitchState();
}

class _PlayOrShufflesSwitchState extends State<PlayOrShufflesSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = 390.9;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            AnimatedPositioned(
              left: isPlay ? 0 : width * 0.50,
              child: Container(
                height: 50,
                width: width * 0.45,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
              ),
              duration: const Duration(milliseconds: 100),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Play",
                          style: TextStyle(
                            color:
                                isPlay ? Colors.white : AppColor.primaryColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : AppColor.primaryColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Shuffle",
                          style: TextStyle(
                            color:
                                isPlay ? AppColor.primaryColor : Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? AppColor.primaryColor : Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlayListSongs extends StatelessWidget {
  final Playlist playlist;
  const PlayListSongs({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: playlist.songs.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed('/song', arguments: playlist.songs[index]);
            },
            child: ListTile(
              leading: Text(
                "${index + 1}",
                style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: Text(
                playlist.songs[index].title,
                style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${playlist.songs[index].description} ->",
                style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}

