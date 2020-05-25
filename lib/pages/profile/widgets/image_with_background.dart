import 'package:flutter/cupertino.dart';

class ImageWithBackground extends StatelessWidget {
  ImageWithBackground({@required String imageURL})
      : assert(imageURL.isNotEmpty),
        _imageURL = imageURL;

  final String _imageURL;
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: const Color(0xffeeeeee),
          ),
          Image.network(
            _imageURL,
          ),
        ],
      );
}
