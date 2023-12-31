import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImageService {
  // How to use this service

  // String Gb_Url = "gs://mohit-ui-collection.appspot.com/";
  // String imgName = "wp5578458-black-asta-wallpapers.png";
  // var url;
  //  FirebaseImageService imageService = FirebaseImageService();
  // Future<void> loadImage(String img) async {
  //   String imageUrl = await imageService.getImageUrl(img);
  //   url = imageUrl;
  //   print(url.toString());
  //   print(imageUrl);
  //   print(Gb_Url);
  //   print(imgName);
  // }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String _storageBucket =
      'gs://mohit-ui-collection.appspot.com/'; // Replace with your actual storage bucket

  Future<String> getImageUrl(String imageName) async {
    String fullPath =
        'images/$imageName'; // Adjust the path based on your storage structure

    try {
      final Reference reference = _storage.ref().child(fullPath);
      final String downloadUrl = await reference.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error fetching image URL: $e');
      return ''; // Return an empty string or handle the error as needed
    }
  }
}
//
// // Example usage:
// void main() async {
//   FirebaseImageService imageService = FirebaseImageService();
//
//   // Replace 'image1.jpg' with the actual image name you want to fetch
//   String imageName = 'image1.jpg';
//
//   // Fetch the image URL
//   String imageUrl = await imageService.getImageUrl(imageName);
//
//   // Construct URLs based on the retrieved image URL
//   String globalUrl = 'url'; // Replace with your global URL
//   String img1 = '$globalUrl/$imageName';
//
//   print('Global URL: $globalUrl');
//   print('Image 1 URL: $img1');
//   print('Actual Image URL: $imageUrl');
// }
