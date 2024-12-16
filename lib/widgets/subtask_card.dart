import 'package:flutter/material.dart';
import 'package:project_manager/app_colors.dart';

class SubtasksCard extends StatefulWidget {
  const SubtasksCard({super.key});

  @override
  State<SubtasksCard> createState() => _SubtasksCardState();
}

class _SubtasksCardState extends State<SubtasksCard> {
  final TextEditingController _textController = TextEditingController();
  bool _isAddingSubtask = false;

  final List<Map<String, dynamic>> _subtasks = [
    {'name': 'App Design', 'avatars': ['assets/avatar1.png'], 'selected': false},
    {'name': 'UI/UX', 'avatars': ['assets/avatar2.png', 'assets/avatar3.png'], 'selected': false},
    {'name': '3D Animation', 'avatars': ['assets/avatar4.png'], 'selected': false},
    {'name': 'Landing Page', 'avatars': ['assets/avatar5.png', 'assets/avatar1.png'], 'selected': false},
  ];

  void _addSubtask() {
    final newTask = _textController.text.trim();
    if (newTask.isNotEmpty) {
      setState(() {
        _subtasks.add({
          'name': newTask,
          'avatars': <String>[],
          'selected': false,
        });
        _textController.clear();
        _isAddingSubtask = false;
      });
    }
  }

  void _toggleSubtaskSelection(int index) {
    setState(() {
      _subtasks[index]['selected'] = !_subtasks[index]['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Subtasks',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Subtask Items List
          ..._subtasks.asMap().entries.map((entry) {
            final index = entry.key;
            final task = entry.value;
            return _buildSubtaskItem(index, task['name'], task['avatars'], task['selected']);
          }),

          const SizedBox(height: 20),

          // Add Subtasks Section
          if (_isAddingSubtask)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter subtask name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: _addSubtask,
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _isAddingSubtask = true;
                      }),
                      child: const Center(
                        child: Text(
                          'Add Subtasks',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _isAddingSubtask = true;
                    }),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSubtaskItem(int index, String taskName, List<String> avatars, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _toggleSubtaskSelection(index),
            child: Icon(
              Icons.check_circle,
              color: selected ? Colors.green : Colors.grey,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),

          // Task Name
          Expanded(
            child: Text(
              taskName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),

          Row(
            children: avatars.map((avatar) {
              return Padding(
                padding: const EdgeInsets.only(left: 4),
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(avatar),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
