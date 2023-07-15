import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrientationLayoutDemo(),
    );
  }
}

class OrientationLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortraitLayout()
              : buildLandscapeLayout();
        },
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
            "https://www.shutterstock.com/shutterstock/photos/610909205/display_1500/stock-photo-camera-610909205.jpg",
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Title',
          style: TextStyle(fontSize: 24),
        ),
        const Text(
          'loreal ipsum',
          style: TextStyle(fontSize: 18),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 9, // Number of grid items
            itemBuilder: (context, index) {
              return Image.network(
                "https://cdn.pixabay.com/photo/2023/06/29/10/33/lion-8096155_640.png",
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                "https://www.shutterstock.com/shutterstock/photos/610909205/display_1500/stock-photo-camera-610909205.jpg",
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Title',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'loreal ipsum',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 9, // Number of grid items
                  itemBuilder: (context, index) {
                    return Image.network(
                      "https://cdn.pixabay.com/photo/2023/06/29/10/33/lion-8096155_640.png",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}


