import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:we_care/db_functions/auth_method.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';

  //  User currentUser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore _fireStore= FirebaseFirestore.instance;
Future<userModel> getUserDetails() async {
//  print("i am here ${currentUser.uid}");

    DocumentSnapshot snapshot =
        await _fireStore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
if(snapshot.data()!=null){
  print("i am here ${snapshot.data() as Map<String, dynamic>}");
    return userModel.fromMap(snapshot.data() as Map<String, dynamic>);
}
return userModel(photoUrl: '', name: '', email: '', phoneNumber: 0, gender: '', city: '');
  }

//  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getFundrise() async* {
// // final fundrise=await _fireStore.collection('fundrise').get(); 
// // print("7777 ${fundrise.docs}");
// // yield fundrise.docs;
//   }
Stream <List<fundriseModel>> getFundrise()=>FirebaseFirestore.instance.collection('fundrise').snapshots().map((event) => event.docs.map((e) => fundriseModel.fromMap(e.data())).toList());

// Stream<List<fundriseModel>> readFundRise() =>
//     FirebaseFirestore.instance.collection('Products').snapshots().map((event) =>
//         event.docs.map((doc) => fundriseModel.fromJson(doc.data())).toList());

// Stream<PlantModel> getCart(String id) => FirebaseFirestore.instance
//     .collection('Products')
//     .doc(id)
//     .snapshots()
//     .map((event) => PlantModel.fromJson(event.data()!));

// Stream<List<CartModel>> getAllCartItems() => FirebaseFirestore.instance
//     .collection('cartCollection')
//     .doc(FirebaseAuth.instance.currentUser  !.uid)
//     .collection('cart')
//     .snapshots()
//     .map((event) =>
//         event.docs.map((e) => CartModel.fromJson(e.data())).toList());

// Future<String> addToCart(CartModel item) async {
//   String res = 'Some error occured';
//   try {
//     DocumentReference<Map<String, dynamic>> cartUser = FirebaseFirestore
//         .instance
//         .collection('cartCollection')
//         .doc(FirebaseAuth.instance.currentUser!.uid);
//     await cartUser.collection('cart').doc(item.productId).set(item.toJson());
//     res = 'success';
//   } catch (err) {
//     print('...........$err');
//   }
//   return res;
// }

// Future<String> addToFav(String productId) async {
//   Map<String, dynamic> data = {'productId': productId};
//   String res = 'Some error occured';
//   try {
//     DocumentReference<Map<String, dynamic>> cartUser = FirebaseFirestore
//         .instance
//         .collection('userCollection')
//         .doc(FirebaseAuth.instance.currentUser!.uid);
//     await cartUser.collection('favCollections').doc(productId).set(data);
//     res = 'success';
//   } catch (err) {
//     print(err);
//   }
//   return res;
// }

// Future<int> incrementQuantity(String id) async {
//   int quantity = 1;
//   final cart = FirebaseFirestore.instance
//       .collection('cartCollection')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('cart')
//       .doc(id);
//   await cart.get().then((value) {
//     quantity = value.data()!['quantity'];
//     quantity++;
//   });
//   cart.update({'quantity': quantity});
//   return quantity;
// }

// Future<int> decrementQuantity(String id) async {
//   int quantity = 1;
//   final cart = FirebaseFirestore.instance
//       .collection('cartCollection')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('cart')
//       .doc(id);
//   await cart.get().then((value) {
//     quantity = value.data()!['quantity'];
//     if (quantity > 1) {
//       quantity--;
//     }
//   });
//   cart.update({'quantity': quantity});
//   return quantity;
// }

// deleteCartItems(String id) async {
//   FirebaseFirestore.instance
//       .collection('cartCollection')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('cart')
//       .doc(id)
//       .delete();
// }

// Future<bool> addAddress(AddressModel address) async {
//   bool isAddress = false;
//   final addressCollection = FirebaseFirestore.instance
//       .collection('address')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('userAddress');
//   await addressCollection.add(address.toJson()).then((value) {
//     address.id = value.id;
//     value.set(address.toJson());
//   });

//   final isAddressExist = await addressCollection.get();
//   if (isAddressExist.docs.isNotEmpty) {
//     isAddress = true;
//   }
//   AddressController().getAddress();
//   return isAddress;
// }

// updateAddress(AddressModel address) async {
//   bool isAddress = false;
//   final addressCollection = FirebaseFirestore.instance
//       .collection('address')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('userAddress');
//   await addressCollection.doc(address.id).set(address.toJson());
//   final isAddressExist = await addressCollection.get();
//   if (isAddressExist.docs.isNotEmpty) {
//     isAddress = true;
//   }
//   AddressController().getAddress();
//   return isAddress;
// }

// Future<bool> isAddress() async {
//   bool isAddress = false;
//   final addressCollection = await FirebaseFirestore.instance
//       .collection('address')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('userAddress')
//       .get();
//   if (addressCollection.docs.isNotEmpty) {
//     isAddress = true;
//   }
//   return isAddress;
// }

// Future<bool> addOrders(OrderModel order) async {
//   bool isAdded = false;
//   final orderCollection = FirebaseFirestore.instance
//       .collection('orders')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('userOrder');
//   await orderCollection.add(order.toJson()).then((value) {
//     isAdded = true;
//   });
//   // AddressController().getAddress();
//   return isAdded;
// }