import 'package:flutter/material.dart';

class ContentManagementPage extends StatelessWidget {
  const ContentManagementPage({super.key});

  final dummyContent = const [
    {
      "title": "Mental Wellness Article",
      "category": "Health",
      "status": "Published",
      "author": "Sakshi Sadgir"
    },
    {
      "title": "Nutrition Guide",
      "category": "Food",
      "status": "Draft",
      "author": "John Doe"
    },
    {
      "title": "Exercise Video",
      "category": "Fitness",
      "status": "Published",
      "author": "Emily Clark"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Content Management",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search content...",
              prefixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              fillColor: Colors.blue[50],
              filled: true,
            ),
          ),
          const SizedBox(height: 16),

          // Content list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyContent.length,
            itemBuilder: (context, index) {
              final content = dummyContent[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Icon(Icons.article, color: Colors.blue),
                  title: Text(content['title']!),
                  subtitle: Text("Category: ${content['category']} | Author: ${content['author']}"),
                  trailing: Text(content['status']!,
                      style: TextStyle(
                          color: content['status'] == 'Published'
                              ? Colors.green
                              : Colors.orange,
                          fontWeight: FontWeight.bold)),
                  onTap: () {
                    // Optionally open content detail
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
