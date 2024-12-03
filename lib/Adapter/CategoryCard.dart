import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String name;
  final String description;
  final String? type;
  final String? price;
  final String? imageUrl;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.name,
    required this.description,
    this.type,
    this.price,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display image if available
            imageUrl != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://buatevent.id/uploads/$imageUrl',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            )
                : Container(width: 80, height: 80, color: Colors.grey[300]),

            SizedBox(width: 12),

            // Display details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 6),
                  if (type != null)
                    Text(
                      type!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  if (price != null)
                    Text(
                      'Price: Rp.${price!}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700]),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
