import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Core/Providers/ArticlesProviders.dart';
import 'package:news_app/UI/Screens/ReadArticle.dart';
import 'package:provider/provider.dart';

import '../../Core/Models/ArticleModel.dart';
import '../Components/ArticleTile.dart';
import '../Components/CustomTabBarView.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "News App",
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {},
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
      ),
      body: Consumer<ArticlesProvider>(builder: (_, articlesProvider, child) {
        final categories = articlesProvider.categories;
        return CustomTabBarView(
          initPosition: 0,
          itemCount: categories.length,
          tabBuilder: (context, index) => Tab(
            text: categories[index].toUpperCase(),
          ),
          pageBuilder: (context, index) {
            if(index == 0){
              return FutureBuilder(
                  future: articlesProvider.articles,
                  builder: (_, AsyncSnapshot<List<ArticleModel>> snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ));
                    }
                    final articles = snapShot.data;
                    if (articles != null && articles.isNotEmpty) {
                      return ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          itemBuilder: (_, index) {
                            return ArticleTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>ReadArticle(article: articles[index])));
                              },
                              article: articles[index],
                            );
                          },
                          separatorBuilder: (_, index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                          itemCount: articles.length);
                    }
                    return const Text("Nodata Foun");
                  });
            }
            return ChangeNotifierProvider.value(
              value: articlesProvider.providers[index],
              child: Consumer<ArticlesProvider>(
                  builder: (_, articlesProvider, child) {
                return FutureBuilder(
                    future: articlesProvider.headLines,
                    builder: (_, AsyncSnapshot<List<ArticleModel>> snapShot) {
                      if (snapShot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ));
                      }
                      final articles = snapShot.data;
                      if (articles != null && articles.isNotEmpty) {
                        return ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            itemBuilder: (_, index) {
                              return ArticleTile(
                                article: articles[index],
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ReadArticle(article: articles[index])));
                                },
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemCount: articles.length);
                      }
                      return const Text("Nodata Foun");
                    });
              }),
            );
          },
          onPositionChange: (index) {
            // print('current position: $index');
            // initPosition = index;
          },
          onScroll: (position) {
            // print('$position')
          },
        );
      }),
    );
  }
}
