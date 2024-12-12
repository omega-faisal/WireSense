import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  static String url = 'http://192.168.101.140:8000';

  static Future<void> getProperties() async {
    Map<String, dynamic> data = {
      "EMUL_OIL_L_TEMP_PV_VAL0": 50.0,
        "STAND_OIL_L_TEMP_PV_REAL_VAL0": 55.0,
        "GEAR_OIL_L_TEMP_PV_REAL_VAL0": 60.0,
        "EMUL_OIL_L_PR_VAL0": 65.0,
        "QUENCH_CW_FLOW_EXIT_VAL0": 70.0,
        "CAST_WHEEL_RPM_VAL0": 75.0,
        "BAR_TEMP_VAL0": 80.0,
        "QUENCH_CW_FLOW_ENTRY_VAL0": 85.0,
        "GEAR_OIL_L_PR_VAL0": 90.0,
        "STANDS_OIL_L_PR_VAL0": 95.0,
        "TUNDISH_TEMP_VAL0": 100.0,
        "RM_MOTOR_COOL_WATER__VAL0": 105.0,
        "ROLL_MILL_AMPS_VAL0": 990.0,
        "RM_COOL_WATER_FLOW_VAL0": 115.0,
        "EMULSION_LEVEL_ANALO_VAL0": 120.0,
        "Furnace_Temperature": 125.0,
        "%SI": 0.006,
        "%FE": 0.001,
        "%TI": 0.02,
        "%V": 0.02,
        "%AL": 98.6
    };

    Dio dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      ),
    );

    try {
      final response = await dio.post('$url/api/manual_predict/', data: data);

      if (response.statusCode == 200) {
        debugPrint('data from ml model is -> ${response.data}');
      } else if (response.statusCode == 400) {
        debugPrint('error is -> bad request');
      } else {
        debugPrint(
          'error:Failed to get data from model. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        debugPrint('DioError: ${dioError.response?.data}');
      } else {
        debugPrint('DioError: ${dioError.message}');
      }
    } catch (e) {
      debugPrint('Exception caught: $e');
    }
  }

  static Future<void> getParameters() async {
    Map<String, dynamic> data = {
        "UTS": "59.50000000000000000000",
        "Elongation": "55.80000000000000000000",
        "Conductivity": "50.50000000000000000000"
          };

    Dio dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      ),
    );

    try {
      final response = await dio.post('$url/reverse_predict/', data: data);

      if (response.statusCode == 200) {
        debugPrint('data from ml model is -> ${response.data}');
      } else if (response.statusCode == 400) {
        debugPrint('error is -> bad request');
      } else {
        debugPrint(
          'error:Failed to get data from model. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        debugPrint('DioError: ${dioError.response?.data}');
      } else {
        debugPrint('DioError: ${dioError.message}');
      }
    } catch (e) {
      debugPrint('Exception caught: $e');
    }
  }

  static Future<bool> loginUser({required String employeeId, required String password}) async {
    Map<String, dynamic> data = {
      "employee_id":employeeId,
      "password":password
    };

    Dio dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      ),
    );

    try {
      final response = await dio.post('$url/api/employee_login/', data: data);

      if (response.statusCode == 200) {
        debugPrint('user successfully registered-> ${response.data}');
        return true;
      } else if (response.statusCode == 401) {
        debugPrint('error is -> invalid credentials');
        return false;
      } else {
        debugPrint(
          'error:Failed to login model. Status code: ${response.statusCode}',
        );
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        debugPrint('DioError: ${dioError.response?.data}');
        return false;
      } else {
        debugPrint('DioError: ${dioError.message}');
        return false;
      }
    } catch (e) {
      debugPrint('Exception caught: $e');
      return false;
    }
  }
}
