import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Core/Models/ArticleModel.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:url_launcher/url_launcher.dart';

class ReadArticle extends StatefulWidget {
  final ArticleModel article;

  const ReadArticle({super.key, required this.article});

  @override
  State<ReadArticle> createState() => _ReadArticleState();
}

class _ReadArticleState extends State<ReadArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black45,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.network(
                  widget.article.urlToImage ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
                Positioned(
                    top: MediaQuery.of(context).viewPadding.top + 15,
                    left: 15,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(1000),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: Colors.white54),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 20,
                        ),
                      ),
                    )),
                Positioned(
                    top: MediaQuery.of(context).viewPadding.top + 15,
                    right: 15,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(1000),
                      onTap: () {
                        final url = widget.article.url;
                        if (url != null) {
                          launchUrl(Uri.parse(url));
                        }
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: Colors.white54),
                        child: Icon(
                          Icons.share_rounded,
                          size: 20,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Text(
                  widget.article.title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  htmlparser.parse(widget.article.content ?? '').body?.text ??
                      '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.6,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
