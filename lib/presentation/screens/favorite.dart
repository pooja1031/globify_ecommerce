// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:myshopping/Providers/favorite_providers.dart';

// // class Myfav extends StatefulWidget {
// //   const Myfav({super.key});

// //   @override
// //   State<Myfav> createState() => _MyfavState();
// // }

// // class _MyfavState extends State<Myfav> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final provider =FavoriteProvider.of(context);
// //     final finalList = provider.favorites;
// //     return   Scaffold(
// // body:Column(
// //   children:  [
// //     Padding(
// //       padding: const EdgeInsets.only(top:20,left:20),
// //       child: Row(
// //         children:const  [
// //           Text("Favorites",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
// //           ),
// //         ],
// //       ),
// //     ),
// //     Expanded(child: ListView.builder(
// //       itemCount: finalList.length,
// //       itemBuilder: (context,index){
// //         return Padding(padding:const EdgeInsets.all(8),
// //         child:ListTile(title: Text(finalList[index].name,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
// //         ),

// //         subtitle: Text(finalList[index].description,
// //         overflow: TextOverflow.ellipsis,),
// //         leading:CircleAvatar(radius:30,
// //         backgroundImage: AssetImage(finalList[index].image),
// //         backgroundColor: Colors.red.shade100,
// //         ),
// //         trailing: Text('\$${finalList[index].price}',
// //         style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
// //         tileColor: Colors.white,
// //         )
        
// //         );
// //       }))
// //   ],
// // )

// //   );
// //   }
// // }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:myshopping/Providers/favorite_providers.dart';

// class Myfav extends StatefulWidget {
//   const Myfav({super.key});

//   @override
//   State<Myfav> createState() => _MyfavState();
// }

// class _MyfavState extends State<Myfav> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = FavoriteProvider.of(context);
//     final finalList = provider.favorites;

//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 20),
//             child: Row(
//               children: const [
//                 Text(
//                   "Favorites",
//                   style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//                 childAspectRatio: 0.7, // Adjust as needed
//               ),
//               itemCount: finalList.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundImage: AssetImage(finalList[index].image),
//                           backgroundColor: Colors.red.shade100,
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           finalList[index].name,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           finalList[index].description,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           '\$${finalList[index].price}',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshopping/Providers/favorite_providers.dart';

class Myfav extends StatefulWidget {
  const Myfav({Key? key});

  @override
  State<Myfav> createState() => _MyfavState();
}

class _MyfavState extends State<Myfav> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: const [
                  Text(
                    "Wishlist",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7, 
                ),
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(finalList[index].image),
                                  fit: BoxFit.cover,
                                  
                                ),
                                color: Colors.white
                              ),
                            ),
                             Padding(
                padding: const EdgeInsets.only(top:100.0,left:200),
                child: Stack(
                  children: [
                    Container(width:45,
                    height:30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                    color:Colors.black
                    ),
                    
                    ),
                    Center(child: Icon(Icons.add,color:Colors.white))
                  ],
                ),
              ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () =>
                                    provider.toggleFavorite(finalList[index]),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 247, 240, 240),
                                  child: Icon(
                                    provider.isExist(finalList[index])
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  finalList[index].name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  finalList[index].description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '\$${finalList[index].price}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
