import 'package:conerpis_news/src/dashboard/news_state.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNews = ref.watch(newsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch News'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
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
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //** Breaking News and show more section */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breaking News',
                    style: GoogleFonts.spaceGrotesk(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Show More',
                  ),
                ],
              ),
              const Gap(12),
              //** Card News Section */
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/openai.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Daniel',
                          style: TextStyle(color: Colors.yellow),
                        ),
                        Text(
                          'Yep, Learning man is becoming a thing',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(6),
                        const Text(
                          'Author: Kyle Wigger',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(12),
              //** Recommended News and show more section */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended for you',
                    style: GoogleFonts.spaceGrotesk(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Show More',
                  ),
                ],
              ),
              const Gap(14),
              //? Fetch Data Section
              getNews.when(
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => context.pushNamed(
                      'newsDetails',
                      pathParameters: {'getIndex': index.toString()},
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                data[index].urlToImage ??
                                    "https://www.outsystems.com/Forge_CW/_image.aspx/Q8LvY--6WakOw9afDCuuGfdpOypWf7wwQViUz4gj-GY=/newsapi-2023-01-04%2000-00-00-2023-08-11%2005-48-06",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      data[index].title!,
                                      maxLines: 2,
                                      style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Text(
                                      '${data[index].description}',
                                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                                      maxLines: 3,
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                error: (error, stack) => Center(
                  child: Text('error'),
                ),
                loading: () => Center(child: CircularProgressIndicator()),
              )
              //@
            ],
          ),
        ),
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
