import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const CloseButton(
                  color: Color(0xfffefefe),
                ),
              ),
              const Text(
                'Profile page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffefefe),
                ),
              ),
              IconButton(
                icon: Icon(Icons.share),
                color: const Color(0xfffefefe),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.95),
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                child: Center(
                  child: ClipOval(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: Provider.of<LoginStore>(context).user?.photoUrl ?? '',
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/images/account_circle/normal.png'),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Provider.of<LoginStore>(context).user?.displayName ?? '',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Text(
                    '投稿数: ',
                    style: TextStyle(fontSize: 12),
                  ),
                  const Text(
                    'お気に入り数: ',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
