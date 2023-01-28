import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressWithPercentage extends StatelessWidget {
  const ProgressWithPercentage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress With Percentage'),
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,

            children: [
              SizedBox.expand(
                child: ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              NetworkImageWithProgress(imageUrl: images[index]),
            ],
          );
        },
      ),
    );
  }
}


const images = [
  'https://cdn.pixabay.com/photo/2016/06/20/03/15/pier-1467984_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/11/30/12/29/bicycle-1872682_960_720.jpg',
  'https://cdn.pixabay.com/photo/2018/01/07/09/09/pasqueflower-3066824_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/03/31/14/44/etretat-1292799_960_720.jpg',
  'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/9113865/pexels-photo-9113865.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/2049422/pexels-photo-2049422.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1148998/pexels-photo-1148998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1662298/pexels-photo-1662298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1456291/pexels-photo-1456291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];
class MyCustomProgressIndicator extends StatelessWidget {
  final double percentage;
  const MyCustomProgressIndicator({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                color: Colors.pink,
                backgroundColor: Colors.white,
                strokeWidth: 2,
                value: percentage,
              ),
            ),
          ),
          Center(
              child: Text(
                (percentage* 100).toInt().toString(),
                style: const TextStyle(
                    fontSize: 22
                ),
              )
          )
        ],),
    );
  }
}
class NetworkImageWithProgress extends StatelessWidget {
  final String imageUrl;
  const NetworkImageWithProgress({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (context , child , loadingProgress ){
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null)
        {
          return MyCustomProgressIndicator(
            percentage: bytesLoaded / totalBytes,
          );
        }else{
          return child;
        }
      },
      errorBuilder: (context , error , stackTrace) {
        return Text('error! = ${error.toString()}');
      },
    );
  }
}
