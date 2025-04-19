import 'package:flutter/material.dart';

class CreateWorkspace extends StatefulWidget {
  const CreateWorkspace({super.key});

  @override
  State<CreateWorkspace> createState() => _CreateWorkspaceState();
}

class _CreateWorkspaceState extends State<CreateWorkspace> {
  final TextEditingController workspaceNameController = TextEditingController();
  final TextEditingController workspaceDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Workspace'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: workspaceNameController,
              decoration: const InputDecoration(labelText: 'Workspace Name'),
            ),
            TextField(
              controller: workspaceDescriptionController,
              decoration:
                  const InputDecoration(labelText: 'Workspace Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle workspace creation logic here
                String name = workspaceNameController.text;
                String description = workspaceDescriptionController.text;

                // Example of using the input values
                print('Workspace Name: $name');
                print('Workspace Description: $description');
              },
              child: const Text('Create Workspace'),
            ),
          ],
        ),
      ),
    );
  }
}