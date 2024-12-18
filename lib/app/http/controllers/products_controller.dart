import 'package:tugas_mobile/app/models/products.dart';
import 'package:vania/vania.dart';

class ProductsController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final produk = request.input();
      await Products().query().insert(produk);

      return Response.json({
        "message": "proses input data berhasil di lakukan",
        "data": produk,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "proses tidak berhasil dilakukan,pliss try again",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(Request request) async {
    try {
      final produk = await Products().query().get();

      return Response.json({
        "message": "produk item",
        "data": produk,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "proses tidak berhasil, pliss try again",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final veid = body['vend_id'];
      final name = body['prod_name'];
      final price = body['prod_price'];
      final desc = body['prod_desc'];

      final result = await Products().query().where('prod_id', '=', id).update({
        "vend_id": veid,
        "prod_name": name,
        "prod_price": price,
        "prod_desc": desc,
      });

      if (result > 0) {
        return Response.json(
          {
            'message': 'proses update yang dilakukan telah berhasil',
            'updated_id': id,
          },
          200,
        );
      } else {
        return Response.json(
          {'message': 'tidak dapat melakukan update data, pliss try again'},
          404,
        );
      }
    } catch (e) {
      return Response.json({
        'message': 'tidak berhasil, silahkan coba lagi',
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      await Products().query().where('prod_id', '=', id).delete();

      return Response.json(
          {"message": "proses delete data berhasil dilakukan"});
    } catch (e) {
      return Response.json(
          {"message": "data products gagal terhapus", "error": e.toString()});
    }
  }
}

final ProductsController productsController = ProductsController();
