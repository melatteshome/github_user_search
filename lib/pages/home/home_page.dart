import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whales_technology/pages/home/home_logic.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: const Color(0xff141D2F),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff141D2F),
            title: const Text('devfinder'),
            actions: [
              Row(
                children: [
                  const Text('LIGHT'),
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
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                              height: 56,
                              width: double.infinity,
                              child: TextFormField(
                                onFieldSubmitted: (value) async {
                                  logic.searchUser();
                                },
                                onChanged: (v) {},
                                style: const TextStyle(color: Colors.white),
                                autofocus: true,
                                controller: logic.textEditingController,
                                decoration: InputDecoration(
                                    fillColor: const Color(0xff1E2A47),
                                    filled: true,
                                    prefix: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, top: 7),
                                      child: SvgPicture.asset(
                                        'assets/icon-search.svg',
                                        height: 20,
                                      ),
                                    ),
                                    suffix: ElevatedButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        primary: const Color(0xff0079ff),
                                        onSurface: Colors.white,
                                      ),
                                      onPressed: () {
                                        logic.searchUser();
                                      },
                                      child: const Text(
                                        'Search',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            )),
                      ),
                    ],
                  ),
                  logic.isLoading.value
                      ? const CircularProgressIndicator()
                      : Card(
                          color: const Color(0xff1E2A47),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 0),
                                  child: logic.searchResult.value.avatarUrl ==
                                          ''
                                      ? CircleAvatar(
                                          child: SvgPicture.asset(
                                              'assets/tweeter.svg'))
                                      : CircleAvatar(
                                          backgroundImage: NetworkImage(logic
                                                  .searchResult
                                                  .value
                                                  .avatarUrl ??
                                              ''),
                                        ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              logic.searchResult.value.name ==
                                                      ''
                                                  ? 'The Octocat'
                                                  : logic.searchResult.value
                                                          .name ??
                                                      '',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              logic.searchResult.value.name ==
                                                      ''
                                                  ? 'Joined 25 Jan 2020'
                                                  : logic.searchResult.value
                                                      .createdAt
                                                      .toString()
                                                      .substring(
                                                        0,
                                                        logic.searchResult.value
                                                            .createdAt
                                                            .toString()
                                                            .indexOf(':'),
                                                      ),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        logic.searchResult.value.login ??
                                            '@Octocat',
                                        style: const TextStyle(
                                            color: Color(0xff0079ff)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      logic.searchResult.value.bio == ''
                                          ? const Text(
                                              'The Profile has no bio.',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          : Text(
                                              logic.searchResult.value.bio ??
                                                  '',
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        color: const Color(0xff141D2F),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text('Repos',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  Text(
                                                      logic.searchResult.value
                                                                  .name ==
                                                              ''
                                                          ? '8'
                                                          : logic.searchResult
                                                              .value.followers
                                                              .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.grey))
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text('Follower',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  Text(
                                                      logic.searchResult.value
                                                                  .name ==
                                                              ''
                                                          ? '3938'
                                                          : logic.searchResult
                                                              .value.followers
                                                              .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.grey)),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text('Following',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  Text(
                                                      logic.searchResult.value
                                                                  .name ==
                                                              ''
                                                          ? '9'
                                                          : logic.searchResult
                                                              .value.following
                                                              .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.grey)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icon-location.svg',
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                logic.searchResult.value.name ==
                                                        ''
                                                    ? 'San Francisco'
                                                    : logic.searchResult.value
                                                            .location ??
                                                        'No location',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          FittedBox(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icon-twitter.svg',
                                                ),
                                                const SizedBox(width: 5),
                                                logic.searchResult.value
                                                            .twitterUsername ==
                                                        ''
                                                    ? const Text(
                                                        'Not available',
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color:
                                                                Colors.white),
                                                      )
                                                    : Text(
                                                        logic.searchResult.value
                                                                .twitterUsername ??
                                                            '',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      FittedBox(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icon-website.svg',
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    logic.searchResult.value
                                                                .htmlUrl ==
                                                            ''
                                                        ? 'https://github.blog'
                                                        : logic.searchResult
                                                            .value.htmlUrl
                                                            .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      overflow:
                                                          TextOverflow.clip,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icon-company.svg',
                                                  ),
                                                  const SizedBox(width: 5),
                                                  logic.searchResult.value
                                                              .company ==
                                                          ''
                                                      ? const Text(
                                                          '@git hub',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      : Text(
                                                          logic
                                                                  .searchResult
                                                                  .value
                                                                  .company ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
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
                ],
              ),
            ),
          ),
        ));
  }
}
