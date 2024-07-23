import 'package:department_store_assignment/domain/entities/department_store_model.dart';
import 'package:flutter/material.dart';

class DepartmentWidget extends StatelessWidget {
  final DepartmentStoreModel departmentStoreModel;

  const DepartmentWidget({required this.departmentStoreModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              departmentStoreModel.imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  departmentStoreModel.name,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          )
          //Image.network(departmentStoreModel.imageUrl),
        ],
      ),
    );
  }
}
