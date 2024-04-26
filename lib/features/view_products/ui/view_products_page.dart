import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/edit_products/ui/edit_products_page.dart';
import 'package:flutter/material.dart';

class ViewProductsPage extends StatefulWidget {
  const ViewProductsPage({super.key});

  @override
  State<ViewProductsPage> createState() => _ViewProductsPageState();
}

class _ViewProductsPageState extends State<ViewProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(14),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Product').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              final productDocs = snapshot.data!.docs ?? [];
              return ListView.builder(
                  itemCount: productDocs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productDocs[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),),
                                  Text(productDocs[index]['product']),
                                  const SizedBox(height: 12,),
                                  Text(productDocs[index]['status'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      color: productDocs[index]['status'] == 'SOLD OUT'? Colors.red:Colors.purpleAccent.shade700
                                    ),),
                                  const SizedBox(height: 12,),
                                  SizedBox(
                                    height: 34,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductsPage(
                                          productName: productDocs[index]['name'],
                                          description: productDocs[index]['product'],
                                          price: productDocs[index]['price'],
                                          status: productDocs[index]['status'],
                                          productId: productDocs[index].id,
                                        )));
                                      },
                                      child: const Text('EDIT',
                                          style: TextStyle(
                                              color: Colors.white
                                          )
                                      ),
                                    ),
                                  )
                                  // Text(productDocs[index]['status'])
                                ],
                              ),
                            ),
                            Text("Rs."+productDocs[index]['price'].toString()+ "/-",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                color: Colors.teal
                              ),)
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
