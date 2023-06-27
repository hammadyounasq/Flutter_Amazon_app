import 'package:amazon_clone_flutter/common/widgets/loader.dart';
import 'package:amazon_clone_flutter/feature/account/screens/widgets/single_product.dart';
import 'package:amazon_clone_flutter/feature/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_flutter/feature/admin/services/admin_services.dart';
import 'package:amazon_clone_flutter/models/product.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<product>? productss = [];
  final AdminService adminService = AdminService();

  @override
  void initState() {
    super.initState();
    fectchAllProducts();
  }

  void deleteProduct(product producto, int index) async {
    adminService.delete(
        context: context,
        products: producto,
        onSuccess: () {
          productss!.removeAt(index);
          setState(() {});
        });
  }

  void fectchAllProducts() async {
    productss = await adminService.fetchAllProducts(
      context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return productss == null
        ? Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: productss!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = productss![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(image: productData.images[0]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              productData.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteProduct(productData, index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductScreen.routeName)
                    .then((val) => val != null ? fectchAllProducts() : null);
                print(productss);
              },
              child: Icon(Icons.add),
              tooltip: 'add a products',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
