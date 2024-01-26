//https://www.google.com/search?q=autoroute+flutter&sca_esv=601719464&tbm=vid&sxsrf=ACQVn09SPkOYZvx2O2-je-JuG_NYovf6Bw:1706273765491&source=lnms&sa=X&ved=2ahUKEwis0bmNjfuDAxUmXvEDHS1UDU4Q_AUoA3oECAEQBQ&biw=1280&bih=551&dpr=1.5#fpstate=ive&vld=cid:bf6f5157,vid:Th83H6qv4Z8,st:0
//https://pub.dev/packages/auto_route#generated-routes

import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';
//part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
   AutoRoute(page: SupplierRoute.page),
    AutoRoute(page: HomeRoute.page, initial: true)
  ];
}

