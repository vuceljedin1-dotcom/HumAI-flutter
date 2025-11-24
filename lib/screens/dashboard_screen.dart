import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final name = (args?['name'] as String?) ?? 'HumAI Athlete';
    final sport = (args?['sport'] as String?) ?? 'High-performance role';
    final goal = (args?['goal'] as String?) ?? 'Achieve DEA standards';

    return Scaffold(
      appBar: AppBar(
        title: const Text('HumAI Digital Twin'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pozdrav, $name 👋',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                sport,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              _GoalBanner(goal: goal),
              const SizedBox(height: 20),
              const Text(
                'Današnje stanje (HumAI snapshot)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: _MetricCard(
                      label: 'Recovery index',
                      value: '82%',
                      subtitle: 'Zelena zona',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _MetricCard(
                      label: 'Load',
                      value: '64',
                      subtitle: 'Kontrolisani napor',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: _MetricCard(
                      label: 'Sleep score',
                      value: '7.4h',
                      subtitle: 'Stabilno',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _MetricCard(
                      label: 'Readiness',
                      value: 'High',
                      subtitle: 'Spreman za rad',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'HumAI · NVIDIA orchestration',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ovdje kasnije spajamo live senzore, NVIDIA NGC modele i BPM RED mikrocikluse u real-time Track&Board.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.tealAccent.shade400,
                    side: BorderSide(color: Colors.tealAccent.shade400),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    // Ovdje kasnije ide call prema NVIDIA / HumAI API-ju
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'HumAI ↔ NVIDIA sync je za sada mock. Kasnije ovdje ide pravi API call.',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Sync HumAI · NVIDIA snapshot',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Slijedeći koraci',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '• Dodati dnevni trening & recovery log\n'
                '• Povezati senzore (Garmin, Whoop, itd.)\n'
                '• Implementirati BPM RED mikrocikluse i Credly credentialing',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String subtitle;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalBanner extends StatelessWidget {
  final String goal;

  const _GoalBanner({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF22D3EE), Color(0xFF4ADE80)],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(Icons.flag, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Glavni cilj: $goal',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}