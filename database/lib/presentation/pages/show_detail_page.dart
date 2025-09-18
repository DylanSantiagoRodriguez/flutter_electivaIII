import 'package:database/domain/entities/show.dart';
import 'package:database/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seasonsProvider = FutureProvider.family((ref, int showId) async {
  final repo = ref.read(repositoryProvider);
  return repo.getSeasonsByShow(showId);
});

final episodesProvider = FutureProvider.family((ref, int seasonId) async {
  final repo = ref.read(repositoryProvider);
  return repo.getEpisodesBySeason(seasonId);
});

class ShowDetailPage extends ConsumerWidget {
  final Show show;
  const ShowDetailPage({super.key, required this.show});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasonsAsync = ref.watch(seasonsProvider(show.id));
    return Scaffold(
      appBar: AppBar(title: Text(show.title)),
      body: seasonsAsync.when(
        data: (seasons) => ListView.builder(
          itemCount: seasons.length,
          itemBuilder: (c, i) {
            final season = seasons[i];
            final eps = ref.watch(episodesProvider(season.id));
            return ExpansionTile(
              title: Text('Temporada ${season.seasonNumber}'),
              subtitle: Text('${season.episodesCount} episodios'),
              children: [
                eps.when(
                  data: (list) => Column(
                    children: list
                        .map((e) => ListTile(
                              title: Text('Episodio ${e.episodeNumber}'),
                              subtitle: Text('${e.durationMinutes} min'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(e.watched ? Icons.check_box : Icons.check_box_outline_blank),
                                    onPressed: () => ref.read(repositoryProvider).markEpisodeWatched(e.id, !e.watched).then((_) => ref.refresh(episodesProvider(season.id))),
                                  ),
                                  PopupMenuButton<int>(
                                    onSelected: (r) => ref.read(repositoryProvider).rateEpisode(e.id, r).then((_) => ref.refresh(episodesProvider(season.id))),
                                    itemBuilder: (c) => List.generate(10, (i) => PopupMenuItem(value: i + 1, child: Text('★ ${i + 1}'))),
                                    child: Text('★ ${e.rating ?? '-'}'),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                  loading: () => const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                  error: (e, _) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(e.toString()),
                  ),
                )
              ],
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}


