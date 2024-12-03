import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PDFDownloadButton extends StatelessWidget {
  final String pdfUrl;

  PDFDownloadButton({required this.pdfUrl});

  Future<void> _openPdf(String _pdfUrl, BuildContext context) async {
    try {
      await launchUrlString(_pdfUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch $_pdfUrl: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open PDF')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openPdf(pdfUrl, context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.open_in_browser,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              "Download PDF",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
