import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/model/MotivationCardModel.dart';
import 'package:mentalwellapp/view/ADMIN/motivation_card_history_page.dart';

class MotivationCardAdminPage extends StatefulWidget {
  const MotivationCardAdminPage({super.key});

  @override
  State<MotivationCardAdminPage> createState() =>
      _MotivationCardAdminPageState();
}

class _MotivationCardAdminPageState extends State<MotivationCardAdminPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emojiController = TextEditingController(
    text: '🙂',
  );
  final TextEditingController _orderController = TextEditingController(
    text: '1',
  );

  final List<Color> _presetColors = const [
    Color(0xFFAE70B8),
    Color(0xFFE040FB),
    Color(0xFF00BCD4),
    Color(0xFF4DD0E1),
    Color(0xFFFF9800),
    Color(0xFFFFB74D),
    Color(0xFF4CAF50),
    Color(0xFF81C784),
    Color(0xFFF44336),
    Color(0xFFE57373),
    Color(0xFF6C63FF),
    Color(0xFF8E85FF),
  ];

  Color _selectedColor1 = const Color(0xFFAE70B8);
  Color _selectedColor2 = const Color(0xFFE040FB);

  bool _isActive = true;
  bool _isSaving = false;

  String? _editingId;
  String? _oldText;

  @override
  void dispose() {
    _messageController.dispose();
    _emojiController.dispose();
    _orderController.dispose();
    super.dispose();
  }

  void _clearForm() {
    setState(() {
      _editingId = null;
      _oldText = null;
      _messageController.clear();
      _emojiController.text = '🙂';
      _orderController.text = '1';
      _selectedColor1 = const Color(0xFFAE70B8);
      _selectedColor2 = const Color(0xFFE040FB);
      _isActive = true;
    });
  }

  void _fillForm(MotivationCardModel card) {
    setState(() {
      _editingId = card.id;
      _oldText = card.text;
      _messageController.text = card.text;
      _emojiController.text = card.icon;
      _orderController.text = card.order.toString();
      _selectedColor1 = Color(card.color1);
      _selectedColor2 = Color(card.color2);
      _isActive = card.isActive;
    });
  }

  Future<void> _saveCard() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final adminUid =
          FirebaseAuth.instance.currentUser?.uid ?? 'unknown-admin';
      final text = _messageController.text.trim();
      final icon = _emojiController.text.trim().isEmpty
          ? '🙂'
          : _emojiController.text.trim();
      final order = int.tryParse(_orderController.text.trim()) ?? 1;

      if (_editingId == null) {
        final docRef = FirebaseFirestore.instance
            .collection('motivation_cards')
            .doc();

        await docRef.set({
          'text': text,
          'icon': icon,
          'color1': _selectedColor1.value,
          'color2': _selectedColor2.value,
          'isActive': _isActive,
          'order': order,
          'createdBy': adminUid,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });

        await FirebaseFirestore.instance
            .collection('motivation_card_history')
            .add({
              'cardId': docRef.id,
              'action': 'created',
              'oldText': null,
              'newText': text,
              'changedBy': adminUid,
              'changedAt': FieldValue.serverTimestamp(),
            });
      } else {
        await FirebaseFirestore.instance
            .collection('motivation_cards')
            .doc(_editingId)
            .set({
              'text': text,
              'icon': icon,
              'color1': _selectedColor1.value,
              'color2': _selectedColor2.value,
              'isActive': _isActive,
              'order': order,
              'updatedAt': FieldValue.serverTimestamp(),
            }, SetOptions(merge: true));

        await FirebaseFirestore.instance
            .collection('motivation_card_history')
            .add({
              'cardId': _editingId,
              'action': 'updated',
              'oldText': _oldText,
              'newText': text,
              'changedBy': adminUid,
              'changedAt': FieldValue.serverTimestamp(),
            });
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _editingId == null
                ? 'Card added successfully'
                : 'Card updated successfully',
          ),
        ),
      );

      _clearForm();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error saving card: $e')));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _toggleCardStatus(MotivationCardModel card) async {
    try {
      final adminUid =
          FirebaseAuth.instance.currentUser?.uid ?? 'unknown-admin';
      final newStatus = !card.isActive;

      await FirebaseFirestore.instance
          .collection('motivation_cards')
          .doc(card.id)
          .update({
            'isActive': newStatus,
            'updatedAt': FieldValue.serverTimestamp(),
          });

      await FirebaseFirestore.instance
          .collection('motivation_card_history')
          .add({
            'cardId': card.id,
            'action': newStatus ? 'activated' : 'deactivated',
            'oldText': card.text,
            'newText': card.text,
            'changedBy': adminUid,
            'changedAt': FieldValue.serverTimestamp(),
          });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(newStatus ? 'Card activated' : 'Card deactivated'),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error updating card status: $e')));
    }
  }

  Widget _buildColorPicker({
    required String title,
    required Color selectedColor,
    required ValueChanged<Color> onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _presetColors.map((color) {
            final isSelected = selectedColor.value == color.value;

            return GestureDetector(
              onTap: () => onTap(color),
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.black : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 18)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPreviewCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [_selectedColor1, _selectedColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: _selectedColor2.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white.withOpacity(0.25),
              child: Text(
                _emojiController.text.trim().isEmpty
                    ? '🙂'
                    : _emojiController.text.trim(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                _messageController.text.trim().isEmpty
                    ? 'Preview message will appear here'
                    : _messageController.text.trim(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExistingCards() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('motivation_cards')
          .orderBy('order')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data?.docs ?? [];

        if (docs.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('No cards added yet'),
          );
        }

        return Column(
          children: docs.map((doc) {
            final card = MotivationCardModel.fromMap(doc.data(), doc.id);

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(card.color1).withOpacity(0.18),
                        child: Text(card.icon),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order: ${card.order}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              card.isActive ? 'Active' : 'Inactive',
                              style: TextStyle(
                                color: card.isActive
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => _fillForm(card),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _toggleCardStatus(card),
                        icon: Icon(
                          card.isActive
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      card.text,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add / Edit Motivation Card',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _messageController,
                      maxLines: 3,
                      onChanged: (_) => setState(() {}),
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter message';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _emojiController,
                            onChanged: (_) => setState(() {}),
                            decoration: const InputDecoration(
                              labelText: 'Emoji',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _orderController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Order',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Active'),
                      value: _isActive,
                      onChanged: (value) {
                        setState(() => _isActive = value);
                      },
                    ),
                    const SizedBox(height: 14),
                    _buildColorPicker(
                      title: 'Gradient Color 1',
                      selectedColor: _selectedColor1,
                      onTap: (color) {
                        setState(() => _selectedColor1 = color);
                      },
                    ),
                    const SizedBox(height: 14),
                    _buildColorPicker(
                      title: 'Gradient Color 2',
                      selectedColor: _selectedColor2,
                      onTap: (color) {
                        setState(() => _selectedColor2 = color);
                      },
                    ),
                    const SizedBox(height: 18),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Preview',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildPreviewCard(),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isSaving ? null : _saveCard,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            _isSaving
                                ? 'Saving...'
                                : _editingId == null
                                ? 'Add Card'
                                : 'Update Card',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Divider(),
              const SizedBox(height: 12),
              const Text(
                'Existing Cards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              _buildExistingCards(),
            ],
          ),
        ),
      ),
    );
  }
}
