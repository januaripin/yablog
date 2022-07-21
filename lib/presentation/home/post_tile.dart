import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../const/assets_path.dart';
import '../../domain/entity/post.dart';
import '../../router/app_router_state.dart';
import '../../utils/context_extensions.dart';
import '../../utils/date_time_extentions.dart';
import '../../utils/gap.dart';
import '../app/app_themes.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => AppRouterState().goToPostPage(post.id),
        child: SizedBox(
          width: 324,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 324,
                height: 218,
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  imageUrl: post.meta.featureImage,
                  fit: BoxFit.fitWidth,
                  errorWidget: (context, url, _) => Container(
                    color: context.colorScheme.primary,
                    child: Center(
                      child: Image.asset(AssetsPath.abLogo),
                    ),
                  ),
                ),
              ),
              Gap.p24(),
              Text(
                post.meta.date.yMMMMd(context.defaultLocale),
                style: AppThemes.textTheme.labelSmall,
              ),
              Gap.p16(),
              Text(
                post.meta.title,
                style: AppThemes.textTheme.headlineMedium,
                maxLines: 3,
              ),
              Gap.p16(),
            ],
          ),
        ),
      ),
    );
  }
}
