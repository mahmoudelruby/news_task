import 'package:flutter/material.dart';
import 'package:news_app/view/articles/artical_details_page.dart';
import 'package:news_app/view/articles/artical_card.dart';
import 'package:provider/provider.dart';
import '../../../controllers/news_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> categories = [
    '', 'business', 'entertainment', 'general',
    'health', 'science', 'sports', 'technology'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsController>().fetchTopHeadlines();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search News',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<NewsController>().searchArticles(value);
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map((category) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(category.isEmpty ? 'All' : category),
                          selected: context.watch<NewsController>().selectedCategory == category,
                          onSelected: (_) {
                            context.read<NewsController>().setCategory(category);
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: Consumer<NewsController>(
              builder: (context, newsController, child) {
                if (newsController.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (newsController.error.isNotEmpty) {
                  return Center(child: Text(newsController.error));
                }

                if (newsController.articles.isEmpty) {
                  return const Center(child: Text('No articles available'));
                }

                return RefreshIndicator(
                  onRefresh: () => newsController.fetchTopHeadlines(),
                  child: ListView.builder(
                    itemCount: newsController.articles.length,
                    itemBuilder: (context, index) {
                      final article = newsController.articles[index];
                      return ArticleCard(
                        article: article,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailScreen(article: article),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}