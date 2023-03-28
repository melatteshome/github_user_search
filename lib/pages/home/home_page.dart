import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whales_technology/pages/home/home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141D2F),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff141D2F),
        title: const Text('devfinder'),
        actions: [
          Row(
            children: [
              Text('LIGHT'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icon-sun.svg',
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Card(
            color: const Color(0xff1E2A47),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10, top: 0),
                      child:
                          // data == null
                          //     ?
                          CircleAvatar(
                              child: SvgPicture.asset('assets/octocat.svg'))
                      // : CircleAvatar(
                      //     backgroundImage: NetworkImage(data!['avatar_url']!),
                      //     // radius: 50,
                      //   ),
                      ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                logic.searchResult == null
                                    ? 'The Octocat'
                                    : logic.searchResult.value.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                  logic.searchResult.value.createdAt == 0
                                      ? 'Joined 25 Jan 2020'
                                      : logic.searchResult.value.createdAt
                                          .toString()
                                  // .substring(
                                  //     0,
                                  //     logic.searchResult.value.createdAt.indexOf(':'),
                                  //   ),
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          logic.searchResult == null
                              ? '@Octocat'
                              : logic.searchResult.value.login,
                          style: const TextStyle(color: Color(0xff0079ff)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // data != null
                        //     ? data!['bio'] == null
                        //         ? const Text('There is no bio available.')
                        //         : Text(data!['bio'])
                        //     :
                        const Text('Bio'),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: const Color(0xff141D2F),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [const Text('Repos'), Text('')],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Follower'),
                                    Text(logic.searchResult.value.name != ''
                                        ? '3938'
                                        : logic.searchResult.value.followers
                                            .toString()),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Following'),
                                    Text(logic.searchResult.value.name != ''
                                        ? '9'
                                        : logic.searchResult.value.following
                                            .toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on),
                                const SizedBox(width: 5),
                                logic.searchResult.value.location != ''
                                    ? Text(
                                        logic.searchResult.value.location == ''
                                            ? 'San Francisco'
                                            : logic.searchResult.value.location
                                                .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : const Text('San Francisco'),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon-twitter.svg',
                                ),
                                const SizedBox(width: 5),
                                logic.searchResult.value.twitterUsername == ''
                                    ? const Text('Not available')
                                    : Text(
                                        logic
                                            .searchResult.value.twitterUsername,
                                        overflow: TextOverflow.ellipsis,
                                      )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icon-website.svg',
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      logic.searchResult.value.htmlUrl == ''
                                          ? 'https://github.blog'
                                          : logic.searchResult.value.htmlUrl
                                              .toString(),
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
