import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 394,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        /// TODO: add publisher photo.
                        radius: 25.0,
                        backgroundImage: CachedNetworkImageProvider(
                          'https://arabia.as.com/uploads/images/2020/05/05/115185.jpg',
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'وزارة الصحة العراقية',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontSize: 11),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Text(
                            'منذ ساعة',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'الموقف الوبائي اليومي للأصابات المسجلة لفايروس كورونا المستجد في العراق',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15),
                  ),
                  Text(
                    'تم فحص (٢٤٧٧) نموذج في كافة المختبرات المختصة في العراق وبذلك يكون المجموع الكلي للنماذج المفحوصة منذ بداية تسجيل المرض في العراق (٥١٧٣٧).',
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
                image: DecorationImage(
                  /// TODO: add news photo
                  image: CachedNetworkImageProvider(
                      'https://arabia.as.com/uploads/images/2020/05/05/115185.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
