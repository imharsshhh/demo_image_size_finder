import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget ListTileSubtitleIconAndText(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 10)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff667c89),
          title: const Text("Image Dimensions Example"),
        ),
        body: ListView.separated(
            itemCount: 25,
            separatorBuilder: (context, index) {
              return const Divider(
                height: 5,
                color: Colors.pink,
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.book,
                  color: Colors.black,
                  size: 42,
                ),
                title: const Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        index % 2 == 0
                            ? 'Also, when I add a snackbar action for removing the awawcaw sed,vesvns elv slnves. seesfvbnselvs sevsevlsenv, selvnes semselvmn sevnse;vs.v,smvesogsev msevesjnges;vesvemv'
                            : 'awckawc waklcawci awlcnw lw ndlwad',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ListTileSubtitleIconAndText(Icons.code, 'Kotlin'),
                        ListTileSubtitleIconAndText(Icons.bug_report, '76'),
                        ListTileSubtitleIconAndText(Icons.face, '8647'),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
