import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whales_technology/model/github_user_model.dart';
import 'package:whales_technology/utils/urls.dart';

class HomeLogic extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  var userName = ''.obs;
  var searchResult = GitHubUser(
    avatarUrl: '',
    bio: '',
    blog: '',
    company: '',
    diskUsage: 0,
    email: '',
    eventsUrl: '',
    followers: 0,
    followersUrl: '',
    following: 0,
    followingUrl: '',
    gistsUrl: '',
    gravatarId: '',
    hireable: false,
    htmlUrl: '',
    id: 0,
    location: '',
    login: '',
    name: '',
    nodeId: '',
    organizationsUrl: '',
    ownedPrivateRepos: 0,
    privateGists: 0,
    publicGists: 0,
    publicRepos: 0,
    receivedEventsUrl: '',
    reposUrl: '',
    siteAdmin: false,
    starredUrl: '',
    subscriptionsUrl: '',
    totalPrivateRepos: 0,
    twitterUsername: '',
    type: '',
    url: '',
    createdAt: DateTime(0),
    collaborators: 0,
    updatedAt: DateTime(0),
    twoFactorAuthentication: false,
  ).obs;

  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
  }

  void searchUser() async {
    try {
      var response =
          await dio.get(Urls.searchUser + textEditingController.text);

      if (response.statusCode == 200) {
        searchResult.value = GitHubUser.fromJson(response.data);
      }
    } catch (e) {
      printError(info: '$e');
    }
  }
}
