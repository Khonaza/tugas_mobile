// import 'package:tugas_mobile/app/http/controllers/customers_controller.dart';
import 'package:tugas_mobile/app/http/controllers/auth_controller.dart';
import 'package:tugas_mobile/app/http/controllers/customers_controller.dart';
import 'package:tugas_mobile/app/http/controllers/orders_controller.dart';
import 'package:tugas_mobile/app/http/controllers/productnotes_controller.dart';
import 'package:tugas_mobile/app/http/controllers/products_controller.dart';
import 'package:tugas_mobile/app/http/controllers/vendors_controller.dart';
// import 'package:tugas_mobile/app/http/controllers/productnotes_controller.dart';
// import 'package:tugas_mobile/app/http/controllers/products_controller.dart';
// import 'package:tugas_mobile/app/http/controllers/vendors_controller.dart';
import 'package:vania/vania.dart';
// import 'package:tugas_mobile/app/http/controllers/home_controller.dart';
// import 'package:tugas_mobile/app/http/middleware/authenticate.dart';
// import 'package:tugas_mobile/app/http/middleware/home_middleware.dart';
// import 'package:tugas_mobile/app/http/middleware/error_response_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');
    Router.post("/login", authController.login);
    Router.post("/register", authController.register);

    Router.get("/home", customers.show);
    Router.post("/avangers", customers.create);
    Router.put("/venom/{id}", customers.Put);
    Router.delete("/captain/{id}", customers.destroy);

    Router.get("/show-home", vendorsController.show);
    Router.post("/create-avangers", vendorsController.create);
    Router.put("/update-venom/{id}", vendorsController.update);
    Router.delete("/delete-captain/{id}", vendorsController.destroy);

    Router.get("/show-home", productsController.show);
    Router.post("/create-avangers", productsController.create);
    Router.put("/update-venom/{id}", productsController.update);
    Router.delete("/delete-captain/{id}", productsController.destroy);

    Router.get("/show-home", productnotesController.show);
    Router.post("/create-avangers", productnotesController.create);
    Router.put("/update-venom/{id}", productnotesController.update);
    Router.delete("/delete-captain/{id}", productnotesController.destroy);

    Router.get("/show-home", ordersController.show);
    Router.post("/create-avangers", ordersController.create);
    // Router.put("/update-venom/{id}", ordersController.upda);
    // Router.delete("/delete-captain/{id}", productnotesController.destroy);
  }
}
