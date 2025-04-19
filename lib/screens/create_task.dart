import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _dueDate = DateTime.now().add(Duration(days: 7));
  String _selectedPriority = 'Medium';
  String _selectedMember = 'Me';
  Color _selectedColor = Colors.blue.shade100;
  final List<String> _tags = [];

  final List<Color> _colorOptions = [
    Colors.blue.shade100,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.amber.shade100,
    Colors.purple.shade100,
    Colors.orange.shade100,
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Create New Task',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: _createTask,
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task color selection
            Text(
              'Task Color',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _colorOptions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = _colorOptions[index];
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: _colorOptions[index],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _selectedColor == _colorOptions[index]
                              ? Colors.indigo
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: _selectedColor == _colorOptions[index]
                          ? Icon(Icons.check, color: Colors.indigo)
                          : null,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            
            // Title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Task Title',
                hintText: 'Enter task title',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            
            // Description
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter task description',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 24),
            
            // Due date
            _buildSectionTitle('Due Date'),
            GestureDetector(
              onTap: _selectDueDate,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDate(_dueDate),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.calendar_today, color: Colors.indigo),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            
            // Priority
            _buildSectionTitle('Priority'),
            Row(
              children: [
                _buildPriorityButton('Low', Colors.green),
                SizedBox(width: 12),
                _buildPriorityButton('Medium', Colors.orange),
                SizedBox(width: 12),
                _buildPriorityButton('High', Colors.red),
              ],
            ),
            SizedBox(height: 24),
            
            // Assign to
            _buildSectionTitle('Assign To'),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text('TM', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 12),
                      Text(
                        _selectedMember,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.indigo),
                ],
              ),
            ),
            SizedBox(height: 24),
            
            // Tags
            _buildSectionTitle('Tags'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ..._buildTagChips(),
                GestureDetector(
                  onTap: _showAddTagDialog,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, size: 18),
                        SizedBox(width: 4),
                        Text('Add Tag'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPriorityButton(String priority, Color color) {
    final isSelected = _selectedPriority == priority;
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPriority = priority;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.2) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              priority,
              style: TextStyle(
                color: isSelected ? color : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTagChips() {
    return _tags.map((tag) => 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.indigo.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tag,
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                setState(() {
                  _tags.remove(tag);
                });
              },
              child: Icon(
                Icons.close,
                size: 16,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    ).toList();
  }

  Future<void> _selectDueDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    
    if (picked != null && picked != _dueDate) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  void _showAddTagDialog() {
    final TextEditingController tagController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Tag'),
        content: TextField(
          controller: tagController,
          decoration: InputDecoration(
            hintText: 'Enter tag name',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (tagController.text.isNotEmpty) {
                setState(() {
                  _tags.add(tagController.text);
                });
              }
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _createTask() {
    // Validate form fields
    if (_titleController.text.isEmpty) {
      _showSnackBar('Task title is required');
      return;
    }

    // Here you would typically add the task to your state management system
    // or database and then navigate back

    // For demo purposes, just show a message and go back
    _showSnackBar('Task created successfully');
    Navigator.pop(context);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
} 