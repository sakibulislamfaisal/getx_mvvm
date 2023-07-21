import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';
import 'package:getx_mvvm/res/components/general_exception_widget.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreference userPreference = UserPreference();
  final homeVM = Get.put(HomeViewModel());

  @override
  void initState() {
    super.initState();
    homeVM.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Screen'),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (homeVM.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeVM.error.value == 'No internet') {
              return InternetExceptionsWidget(onPress: () {
                homeVM.refreshUserListApi();
              });
            } else {
              return GeneralExceptionsWidget(onPress: () {
                homeVM.refreshUserListApi();
              });
            }

          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeVM.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeVM
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeVM.userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(
                          homeVM.userList.value.data![index].email.toString()),
                    ),
                  );
                });
        }
      }),
    );
  }
}
