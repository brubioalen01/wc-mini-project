import 'package:flutter/material.dart';
import 'package:wcminiproj/features/messages/presentation/pages/messages.dart';
import 'package:wcminiproj/core/dependency_injection/injection_container.dart';
import 'package:wcminiproj/features/rickyandmorty/presentation/pages/rickyandmorty.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentIndex = 0;
  final pages = [const Messages(), const Rickyandmorty()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
      ),
      home: Scaffold(
          body: MediaQuery.of(context).size.width <= 640
              ? pages[currentIndex]
              : Row(
                  children: [
                    NavigationRail(
                      elevation: 5.0,
                      onDestinationSelected: (value) => setState(() {
                        currentIndex = value;
                      }),
                      labelType: NavigationRailLabelType.all,
                      destinations: const [
                        NavigationRailDestination(
                            icon: Icon(Icons.message), label: Text('Messages')),
                        NavigationRailDestination(
                            icon: Icon(Icons.no_adult_content),
                            label: Text('Characters'))
                      ],
                      selectedIndex: currentIndex,
                    ),
                    Expanded(child: pages[currentIndex]),
                  ],
                ),
          bottomNavigationBar: MediaQuery.of(context).size.width <= 640
              ? BottomNavigationBar(
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  currentIndex: currentIndex,
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Messages',
                      icon: Icon(Icons.message),
                    ),
                    BottomNavigationBarItem(
                      label: 'Characters',
                      icon: Icon(Icons.no_adult_content),
                    )
                  ],
                )
              : null),
    );
  }
}
