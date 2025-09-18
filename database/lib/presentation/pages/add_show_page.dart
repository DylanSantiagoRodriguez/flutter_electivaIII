import 'package:database/domain/entities/enums.dart';
import 'package:database/domain/entities/show.dart';
import 'package:database/domain/entities/watching.dart';
import 'package:database/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddShowPage extends ConsumerStatefulWidget {
  const AddShowPage({super.key});

  @override
  ConsumerState<AddShowPage> createState() => _AddShowPageState();
}

class _AddShowPageState extends ConsumerState<AddShowPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _genreCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();
  final _avgCtrl = TextEditingController(text: '45');
  final _progressCtrl = TextEditingController();
  final _urlCtrl = TextEditingController();
  ShowType _type = ShowType.movie;
  ShowStatus _status = ShowStatus.toWatch;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _genreCtrl.dispose();
    _yearCtrl.dispose();
    _avgCtrl.dispose();
    _progressCtrl.dispose();
    _urlCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Añadir')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleCtrl,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<ShowType>(
                value: _type,
                decoration: const InputDecoration(labelText: 'Tipo'),
                items: const [
                  DropdownMenuItem(value: ShowType.movie, child: Text('Película')),
                  DropdownMenuItem(value: ShowType.series, child: Text('Serie')),
                ],
                onChanged: (v) => setState(() => _type = v ?? ShowType.movie),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _genreCtrl,
                decoration: const InputDecoration(labelText: 'Género'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _yearCtrl,
                decoration: const InputDecoration(labelText: 'Año'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _avgCtrl,
                decoration: const InputDecoration(labelText: 'Duración promedio (min)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<ShowStatus>(
                value: _status,
                decoration: const InputDecoration(labelText: 'Estado'),
                items: const [
                  DropdownMenuItem(value: ShowStatus.toWatch, child: Text('Por ver')),
                  DropdownMenuItem(value: ShowStatus.inProgress, child: Text('En progreso')),
                  DropdownMenuItem(value: ShowStatus.watched, child: Text('Vista')),
                ],
                onChanged: (v) => setState(() => _status = v ?? ShowStatus.toWatch),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _progressCtrl,
                decoration: const InputDecoration(labelText: 'Minuto actual (opcional)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _urlCtrl,
                decoration: const InputDecoration(labelText: 'URL (opcional)'),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final repo = ref.read(repositoryProvider);
                  final id = DateTime.now().millisecondsSinceEpoch;
                  final show = Show(
                    id: id,
                    title: _titleCtrl.text.trim(),
                    type: _type,
                    genre: _genreCtrl.text.trim().isEmpty ? 'General' : _genreCtrl.text.trim(),
                    year: int.tryParse(_yearCtrl.text.trim()) ?? DateTime.now().year,
                    averageDurationMinutes: int.tryParse(_avgCtrl.text.trim()) ?? 45,
                    status: _status,
                  );
                  await repo.upsertShow(show);

                  if (_status == ShowStatus.inProgress) {
                    final minutes = int.tryParse(_progressCtrl.text.trim() ) ?? 0;
                    final watching = Watching(
                      showId: id,
                      seasonId: 0,
                      episodeId: 0,
                      progressMinutes: minutes,
                      updatedAt: DateTime.now(),
                      streamUrl: _urlCtrl.text.trim().isEmpty ? null : _urlCtrl.text.trim(),
                    );
                    await repo.setCurrentWatching(watching);
                  }

                  if (mounted) Navigator.of(context).pop(true);
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


