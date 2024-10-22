import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:salahtrackerapp/features/splash/presentation/widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  static const path = '/home';
  static const name = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Logo(),
        actions: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: ResponsiveNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        // showActiveButtonText: false,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

        activeButtonFlexFactor: 50,
        showActiveButtonText: false,
        backgroundColor: Colors.black,
        backgroundOpacity: .85,

        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
            text: 'Home',
            icon: Icons.home,
          ),
          NavigationBarButton(
            text: 'Trimer',
            icon: Icons.timer,
          ),
          NavigationBarButton(
            text: 'Books',
            icon: Icons.menu_book,
          ),
          NavigationBarButton(
            text: 'Settings',
            icon: Icons.settings,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Isha',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '7 hrs 53 mins until Fajr',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Suhur: 4:27 AM',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Iftar: 6:01 PM',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Tuesday',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(17 Sep, 2024)',
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Rabi' Al-Awwal 13.1446\nAH",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Dhaka, Bangladesh",
                        style: Theme.of(context).textTheme.titleMedium)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Fajr', style: TextStyle(fontSize: 18)),
                    Text('4:28 AM')
                  ],
                ),
                Column(
                  children: [
                    Text('Duhur', style: TextStyle(fontSize: 18)),
                    Text('11:54 AM')
                  ],
                ),
                Column(
                  children: [
                    Text('Asr', style: TextStyle(fontSize: 18)),
                    Text('4:18 AM')
                  ],
                ),
                Column(
                  children: [
                    Text('Magrib', style: TextStyle(fontSize: 18)),
                    Text('6:01 AM')
                  ],
                ),
                Column(
                  children: [
                    Text('Isha', style: TextStyle(fontSize: 18)),
                    Text('7:17 AM')
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Do you pray",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Isha',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.highlight_remove_sharp,
                            color: Colors.redAccent,
                          ),
                          style: Theme.of(context)
                              .iconButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    Colors.white),
                              ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.check_circle_outline_sharp,
                            color: Colors.greenAccent,
                          ),
                          style: Theme.of(context)
                              .iconButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    Colors.white),
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
