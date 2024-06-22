import 'package:dars61/widgets/sliver_header_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      print(scrollController.offset);
    });

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverAppBar(
              // title: Text("Sliver App Bar"),
              // floating: true,
              pinned: true,
              backgroundColor: Colors.amber,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.blue,
                ),
                title: Text("Flexible Space bar"),
              ),
              expandedHeight: 200.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return ListTile(
                  title: Text("List Item $index"),
                );
              },
              childCount: 20,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: const Text(
                  "Salom Header 1",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              minHeight: 60,
              maxHeight: 200,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.amber[100 * (index % 9)],
                  child: Text("Grid Item $index"),
                );
              },
              childCount: 30,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
              child: Container(
                alignment: Alignment.center,
                color: Colors.cyan,
                child: const Text(
                  "Salom Header 2",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              minHeight: 60,
              maxHeight: 200,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.amber[100 * (index % 9)],
                  child: Text("Grid Item $index"),
                );
              },
              childCount: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 160,
                itemCount: 20,
                itemBuilder: (ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
