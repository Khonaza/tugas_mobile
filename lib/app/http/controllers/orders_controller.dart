import 'package:tugas_mobile/app/models/orders.dart';
import 'package:vania/vania.dart';

class OrdersController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request requst) async {
    try{
      final checkout = requst.input();
      await Orders().query().insert(checkout);

      return Response.json({
        "message": "proses checkout berhasil",
        "data": checkout,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "waduh gagal, ulangi lagi ya",
        "error": e.toString()
      },500);

    }
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(Request request) async {
    try {
      final checkout = await Orders().query().get();

      return Response.json({
        "message": "pesanan berhasil",
        "data": checkout,
      }, 201);
    } catch (e) {
      return Response.json(
          {"message": "pesanan gagal, coba lagi bos", "error": e.toString()},
          500);
    }
  }
}

Future<Response> edit(int id) async {
  return Response.json({});
}

Future<Response> update(Request request, int num) async {
  try {
      final body = await request.input();
      final ordernum = body['order_num'];
      final orderdate = body['order_date'];
      final custid = body['cust_id'];

      final result = await Orders().query().where('order_num', '=', num).update(
          {"order_num": ordernum, "order_date": orderdate, "cust_id": custid});

      if (result > 0) {
        return Response.json(
          {
            'message': 'Berhasil diperbarui',
            'updated_num': num,
          },
          200,
        );
      } else {
        return Response.json(
          {'message': 'data tidak berubah'},
          404,
        );
      }
    } catch (e) {
      return Response.json({
        'message': 'ada kesalahan update',
        'error': e.toString(),
      },500);

  }

}

Future<Response> destroy(int id) async {
  return Response.json({});
}

final OrdersController ordersController = OrdersController();
