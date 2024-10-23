import 'package:flutter/material.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollViewWithImage(),
    );
  }
}

class CustomScrollViewWithImage extends StatefulWidget {
  const CustomScrollViewWithImage({super.key});

  @override
  _CustomScrollViewWithImageState createState() =>
      _CustomScrollViewWithImageState();
}

class _CustomScrollViewWithImageState extends State<CustomScrollViewWithImage> {
  double _imageHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollUpdateNotification) {
          setState(() {
            _imageHeight = 200.0 - scrollInfo.scrollDelta!;
            if (_imageHeight < 0) _imageHeight = 0;
          });
        }
        return true;
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _imageHeight,
            child: Image.network(
              'https://via.placeholder.com/350x150',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: _imageHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
