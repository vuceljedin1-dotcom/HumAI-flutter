import 'package:flutter/material.dart';

class IntakeScreen extends StatefulWidget {
  const IntakeScreen({super.key});

  @override
  State<IntakeScreen> createState() => _IntakeScreenState();
}

class _IntakeScreenState extends State<IntakeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _ageCtrl = TextEditingController();
  final TextEditingController _sportCtrl = TextEditingController();
  final TextEditingController _goalCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _ageCtrl.dispose();
    _sportCtrl.dispose();
    _goalCtrl.dispose();
    super.dispose();
  }

  void _goToDashboard() {
    if (_formKey.currentState?.validate() ?? false) {
      // Ovdje kasnije ide slanje na NVIDIA / HumAI API
      Navigator.pushReplacementNamed(context, '/dashboard',
          arguments: {
            'name': _nameCtrl.text.trim(),
            'sport': _sportCtrl.text.trim(),
            'goal': _goalCtrl.text.trim(),
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HumAI Intake'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ulazni profil',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ovo je tvoj prvi korak ka HumAI DigitalTwinu – health & performance standard svjetske klase.',
                ),
                const SizedBox(height: 24),
                _HumaiTextField(
                  controller: _nameCtrl,
                  label: 'Ime i prezime',
                  hint: 'Ammar Karaman',
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Obavezno polje' : null,
                ),
                const SizedBox(height: 16),
                _HumaiTextField(
                  controller: _ageCtrl,
                  label: 'Godine',
                  hint: '24',
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Obavezno polje';
                    }
                    final n = int.tryParse(v);
                    if (n == null || n <= 0 || n > 100) {
                      return 'Unesi realan broj godina';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _HumaiTextField(
                  controller: _sportCtrl,
                  label: 'Primarna disciplina / uloga',
                  hint: 'Sprinter 200m, OS BiH oficir...',
                ),
                const SizedBox(height: 16),
                _HumaiTextField(
                  controller: _goalCtrl,
                  label: 'Glavni cilj 90 dana',
                  hint: 'DEA standard, povratak nakon povrede...',
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.tealAccent.shade400,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: _goToDashboard,
                    child: const Text(
                      'Validiraj i nastavi na Dashboard',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Kasnije ovdje ide pun BPM Intake (disanje, vizualizacija, metrike, consent, itd.).',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HumaiTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int maxLines;

  const _HumaiTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF020617),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF1E293B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.tealAccent),
        ),
      ),
    );
  }
}