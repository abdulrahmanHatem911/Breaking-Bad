import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/my_color.dart';
import 'package:flutter_breaking/data/models/characteer.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      centerTitle: true,
      backgroundColor: MyColor.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickName,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: MyColor.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(color: MyColor.myWhite, fontSize: 16.0),
          )
        ],
      ),
    );
  }

  Widget buildDriver(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColor.myTitleColor,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 5),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('job: ', character.jobs.join("/")),
                    buildDriver(350),
                    characterInfo(
                        'Appeared to : ', character.categoryForTwoSeries),
                    buildDriver(285),
                    characterInfo(
                        'Seasons : ', character.appearanceOfSeason.join(" , ")),
                    buildDriver(315),
                    characterInfo('Status : ', character.statusIfDeadOrAlive),
                    buildDriver(330),
                    character.betterCallSaulAppearance.isEmpty
                        ? Container()
                        : Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                characterInfo(
                                    'Better call saul seasons : ',
                                    character.betterCallSaulAppearance
                                        .join(" , ")),
                                buildDriver(200),
                              ],
                            ),
                          ),
                    characterInfo('Actor / Actress: ', character.actorName),
                    buildDriver(330),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }
}
