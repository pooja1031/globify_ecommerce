import 'package:flutter/material.dart';
import 'package:myshopping/models/my_products.dart';
import 'package:myshopping/presentation/detailed_screen/detailed_screen.dart';
import 'package:myshopping/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected =0;
  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Our Poducts",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductCategories(index:0,name:"all products"),
                                _buildProductCategories(index:1,name:"jackets"),
                _buildProductCategories(index:2,name:"sneakers"),

              ],),
              const SizedBox(height: 20,),
              Expanded(child: isSelected ==0  ? _buildAllProducts() : isSelected ==1
              ? _buildjackets():_buildsneakers(),
              )
          ],
        ),
      );
  
  }

  _buildProductCategories({required int index,required String name})=>
  GestureDetector(
    onTap: ()=>setState(() => isSelected =index
      
    ),
    child: Container(
    width: 100,
    height: 40,
    margin: const EdgeInsets.only(top:10,right:10),
    alignment: Alignment.center,
    decoration: BoxDecoration(color: isSelected ==index ?Colors.red:Colors.red.shade300,
    
    borderRadius: BorderRadius.circular(8),),
    child: Text(name,style: TextStyle(color:Colors.white),),
    
    ),
  );

  _buildAllProducts()=>GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (100/140),crossAxisSpacing: 12,
  mainAxisSpacing: 12),
  scrollDirection: Axis.vertical,
   itemCount: MyProducts.allProducts.length,
   itemBuilder: (context,index){
    final allProducts =MyProducts.allProducts[index];
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>DetailedScreen(products: allProducts))),
      child: ProductCard(products:allProducts));
   },);

   _buildjackets()=>GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (100/140),crossAxisSpacing: 12,
  mainAxisSpacing: 12),
  scrollDirection: Axis.vertical,
   itemCount: MyProducts.jackets.length,
   itemBuilder: (context,index){
    final jackets =MyProducts.jackets[index];
    return GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>DetailedScreen(products: jackets))),

      child: ProductCard(products:jackets));
   },);

_buildsneakers()=>GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (100/140),crossAxisSpacing: 12,
  mainAxisSpacing: 12),
  scrollDirection: Axis.vertical,
   itemCount: MyProducts.sneakersList.length,
   itemBuilder: (context,index){
    final sneakersList =MyProducts.sneakersList[index];
    return GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>DetailedScreen(products: sneakersList))),

      child: ProductCard(products:sneakersList));
   },);


}