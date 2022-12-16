import 'package:flutter/material.dart';
import 'package:news_c7_fri/models/NewsResponse.dart';
import 'package:news_c7_fri/screens/tab_item.dart';
import 'package:news_c7_fri/shared/network/remote/api_manager.dart';

import '../models/SourcesResponse.dart';
import 'news_item.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 8),
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              labelColor: Colors.blue,
              tabs: widget.sources
                  .map((source) => TabItem(
                      source,
                      selectedIndex == widget.sources.indexOf(source)
                          ? true
                          : false))
                  .toList(),
            ),
            FutureBuilder<NewsResponse>(
              future: ApiManager.getNews(widget.sources[selectedIndex].id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text('Something went wrong'),
                        TextButton(onPressed: () {}, child: Text('Try Again'))
                      ],
                    ),
                  );
                }
                if (snapshot.data!.status != "ok") {
                  return Center(
                    child: Column(
                      children: [
                        Text(snapshot.data?.message ?? ""),
                        TextButton(onPressed: () {}, child: Text('Try Again'))
                      ],
                    ),
                  );
                }
                var newsData = snapshot.data?.articles ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return NewsItem(newsData[index]);
                    },
                    itemCount: newsData.length,
                  ),
                );
              },
            )
          ],
        ));
  }
}
