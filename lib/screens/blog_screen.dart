import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  // Danh sách blog mẫu — chỉ cần thay link thật
  final List<Map<String, String>> blogArticles = const [
    {
      'title': 'Chỉ số khối cơ thể (BMI) hữu ích như thế nào?',
      'link':
          'https://www-health-harvard-edu.translate.goog/blog/how-useful-is-the-body-mass-index-bmi-201603302500?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=tc',
      'image': 'assets/images/1.jpg',
    },
    {
      'title': 'Chỉ số BMI lý tưởng ?',
      'link':
          'https://nutritionfacts-org.translate.goog/blog/an-ideal-bmi/?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=tc',
      'image': 'assets/images/2.jpg',
    },
    {
      'title': 'Cách tính BMI chuẩn nam nữ cho người Việt',
      'link':
          'https://wheytot.com/blogs/bai-tap/cach-tinh-bmi-nam?srsltid=AfmBOoqSvObccz8wNZvS2KGtVR9L_iR9x3XqDj0oPkA8pWIFgEgrAS5D',
      'image': 'assets/images/3.jpg',
    },
    {
      'title': 'Các bài tập cho nam giúp tay to khỏe hơn',
      'link': 'hhttps://wheytot.com/blogs/bai-tap/bai-tap-tay-sau',
      'image': 'assets/images/4.jpg',
    },
    {
      'title': 'Tập luyện thể dục như thế nào để giữ BMI ổn định',
      'link':
          'https://www-medilifecenter-com.translate.goog/blog/what-your-bmi-says-about-your-health?_x_tr_sl=en&_x_tr_tl=vi&_x_tr_hl=vi&_x_tr_pto=tc',
      'image': 'assets/images/5.jpg',
    },
  ];

  // Hàm mở link ngoài
  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Không thể mở link: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue.shade600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blog Sức Khỏe & BMI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: themeColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: blogArticles.length,
          itemBuilder: (context, index) {
            final article = blogArticles[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.asset(
                      article['image']!,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () => _openLink(article['link']!),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          icon: const Icon(Icons.open_in_new),
                          label: const Text('Đọc bài viết'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
