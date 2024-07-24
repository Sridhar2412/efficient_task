import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/extensions/context.dart';
import 'package:flutter_master/presentation/extensions/widget.dart';
import 'package:flutter_master/presentation/shared/components/custom_card.dart';
import 'package:flutter_master/presentation/shared/components/description_text.dart';
import 'package:flutter_master/presentation/shared/components/skeleton_widget.dart';
import 'package:flutter_master/presentation/theme/app_color.dart';
import 'package:flutter_master/presentation/theme/app_text_theme.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        FirebaseFirestore.instance.collection("announcements").snapshots();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColor.whiteBackground,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverGap(20),
                SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Announcements',
                        style: AppTextTheme.semiBold25
                            .copyWith(color: AppColor.primary),
                      ),
                    ],
                  ).padHor(),
                ),
                const SliverGap(25),
                // (!state.loading)
                //     ?
                SliverToBoxAdapter(
                  child: StreamBuilder(
                      stream: state,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.data == null) {
                          return ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return SkeletonWidget(
                                  height: context.heightByPercent(25),
                                  width: context.width,
                                ).padHor().pad(bottom: 10);
                              });
                        }
                        if (snapshot.data.docs.isEmpty) {
                          return SizedBox(
                            height: context.heightByPercent(70),
                            child: const Center(
                              child: Text('No data available'),
                            ),
                          );
                        }
                        // try {
                        return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = snapshot.data?.docs[index];
                              return CustomCard(
                                padding: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all()),
                                      width: context.width,
                                      height: context.heightByPercent(25),
                                      child: item?['imgUrl'].isEmpty
                                          ? const Icon(
                                              Icons.photo_album_outlined,
                                              size: 200,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                item?['imgUrl'],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                    ).pad(bottom: 20),
                                    Text(
                                      item?['title'],
                                      style: AppTextTheme.semiBold20.copyWith(
                                          fontSize: 22,
                                          color: AppColor.primary),
                                    ).pad(bottom: 10),
                                    DescriptionTextWidget(
                                      text: item?['description'],
                                      readMoreStyle: AppTextTheme.label14
                                          .copyWith(color: AppColor.primary),
                                      textstyle: AppTextTheme.medium14
                                          .copyWith(fontSize: 15)
                                          .copyWith(color: AppColor.grey),
                                    ),
                                  ],
                                ),
                              ).padHor().pad(bottom: 10).pad(bottom: 10);
                            });
                        // } catch (e) {
                        //   print(e);
                        // }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
