import 'package:department_store_assignment/domain/repositories/department_store_repository.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_bloc.dart';
import 'package:department_store_assignment/app_dependency_injection.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_event.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_state.dart';
import 'package:department_store_assignment/presentation/widget/department_widget.dart';
import 'package:department_store_assignment/presentation/widget/loading_widget.dart';
import 'package:department_store_assignment/presentation/widget/product_detail_dialog.dart';
import 'package:department_store_assignment/presentation/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentStorePage extends StatefulWidget {
  const DepartmentStorePage({super.key});

  @override
  State<DepartmentStorePage> createState() => _DepartmentStorePageState();
}

class _DepartmentStorePageState extends State<DepartmentStorePage> {
  late final _departmentStoreBloc =
      DepartmentStoreBloc(injector.get<DepartmentStoreRepository>());

  void _onListener(BuildContext context, DepartmentStoreState state) {
    switch (state.status) {
      case DepartmentStoreStatus.loadingState:
        LoadingDialog.show(context: context);
      case DepartmentStoreStatus.getDepartmentStoreSuccessState:
      case DepartmentStoreStatus.getProductSuccessState:
        LoadingDialog.dismiss(context: context);
      case DepartmentStoreStatus.getDepartmentStoreEmptyState:
      case DepartmentStoreStatus.getProductEmptyState:
      case DepartmentStoreStatus.getDepartmentStoreError:
      case DepartmentStoreStatus.getProductError:
        LoadingDialog.dismiss(context: context);
      //Show Error state && empty state
      default: //do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _departmentStoreBloc..add(GetDepartmentStoreEvent()),
      child: BlocConsumer<DepartmentStoreBloc, DepartmentStoreState>(
          listener: (context, state) => _onListener(context, state),
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'Department carousel',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    _buildDepartmentStoreList(),
                    state.departmentSelected.name.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.all(8),
                            child: Text(
                              'Product list : ${state.departmentSelected.name}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          )
                        : const SizedBox(),
                    _buildProductList(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildDepartmentStoreList() {
    return BlocBuilder<DepartmentStoreBloc, DepartmentStoreState>(
        buildWhen: (prev, curr) =>
            curr.status == DepartmentStoreStatus.getDepartmentStoreSuccessState,
        builder: (context, state) {
          if (state.status ==
              DepartmentStoreStatus.getDepartmentStoreSuccessState) {
            return SizedBox(
              height: 160,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.departmentStoreList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _departmentStoreBloc.add(GetProductDetailListEvent(
                          model: state.departmentStoreList[index]));
                    },
                    child: DepartmentWidget(
                      departmentStoreModel: state.departmentStoreList[index],
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        });
  }

  Widget _buildProductList() {
    return BlocBuilder<DepartmentStoreBloc, DepartmentStoreState>(
        buildWhen: (prev, curr) =>
            curr.departmentSelected.id != prev.departmentSelected.id,
        builder: (context, state) {
          if (state.status == DepartmentStoreStatus.getProductSuccessState) {
            return Expanded(
              child: GridView.builder(
                itemCount: state.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, int index) {
                  return GestureDetector(
                      onTap: () => ProductDetailDialog.show(
                          context: context, product: state.productList[index]),
                      child: ProductWidget(
                          productModel: state.productList[index]));
                  //child: Text(state.productList[index].name));
                },
              ),
            );
          }
          return const SizedBox();
        });
  }
}
