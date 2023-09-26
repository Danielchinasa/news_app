import 'package:conerpis_news/src/dashboard/news_state.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailsScreen extends ConsumerWidget {
  const NewsDetailsScreen({super.key, required this.getIndex});

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ** get the news details from the getNews provider
    final newsDetails = ref.watch(newsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FluentIcons.alert_12_regular),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(FluentIcons.search_12_regular),
          )
        ],
      ),
      body: newsDetails.when(
        data: (data) => Column(
          children: [
            Image.network(
              data[getIndex].urlToImage ??
                  "https://www.outsystems.com/Forge_CW/_image.aspx/Q8LvY--6WakOw9afDCuuGfdpOypWf7wwQViUz4gj-GY=/newsapi-2023-01-04%2000-00-00-2023-08-11%2005-48-06",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    '${data[getIndex].title}',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 26,
                      height: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(12),
                  Text('${data[getIndex].description}'),
                  Text('${data[getIndex].content}'),
                ],
              ),
            )
          ],
        ),
        error: (error, stack) => Center(
          child: Text('error'),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      //** Adding a bottom navigation bar */
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_12_regular),
            label: "Home",
            activeIcon: Icon(
              FluentIcons.home_12_filled,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.communication_16_regular),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.bookmark_16_regular),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.person_12_regular),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
