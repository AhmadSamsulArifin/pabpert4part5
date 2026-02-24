Nama : Ahmad Samsul Arifin

Nim : 2409116113

Mata Kuliah : Pemrograman Aplikasi Bergerak


# PART 5: Shopping Cart Hands-On


Pada kali ini saya akan mencoba tugas pada pemrograman aplikasi bergerak pada pertemuan 4 part ke lima yaitu tentang mini e-commerce shopping cart dengan provider. Penjelasannya yang saya pahami yaitu aplikasi e-commerce sederhana yang dibangun menggunakan Flutter dan state management Provider (ChangeNotifier) untuk mengelola data keranjang secara reaktif. Pengguna dapat melihat daftar produk, menambahkan produk ke keranjang, mengubah jumlah item, menghapus item, serta melihat total harga yang dihitung otomatis berdasarkan quantity dan harga produk. Aplikasi ini juga dilengkapi fitur pencarian produk, filter berdasarkan kategori, dan halaman checkout terpisah yang menampilkan ringkasan pesanan serta form data pelanggan dengan validasi sebelum konfirmasi. Struktur project dipisahkan ke dalam folder models dan pages agar kode lebih rapi, dan mudah dikembangkan.


## Untuk Struktur folder sendiri yaitu di bagian lib ada tiga bagian yaitu :

1 models yang berisi class yang mengatur struktur data dan logic utama aplikasi.


  - product.dart (Untuk menyimpan model data produk seperti id, name, price, emoji, description, dan category).
    
  - cart_item.dart (Untuk merepresentasikan item yang ada di keranjang, berisi Product dan quantity serta perhitungan subtotal).
    
  - cart_model.dart (Berisi seluruh logic pengelolaan cart seperti add item, remove item, update quantity, menghitung total, dan mengelola state menggunakan ChangeNotifier).


2. pages yang berisi tampilan aplikasi
   
   - product_list_page.dart (Merupakan halaman utama yang menampilkan daftar produk dalam bentuk grid, lengkap dengan fitur search dan filter kategori).
     
   - cart_page.dart (Merupakan halaman keranjang yang menampilkan item yang dipilih, tombol tambah/kurang quantity, hapus item, serta total harga dan tombol checkout).
     
   - checkout_page.dart (Merupakan halaman checkout yang menampilkan ringkasan pesanan dan form data pelanggan sebelum konfirmasi order.).
  
3. main yang berisi entry point aplikasi dan tempat setup Provider menggunakan ChangeNotifierProvider agar CartModel dapat diakses oleh seluruh aplikasi.



## Teknologi yang di gunakan yaitu : 


1. Flutter yang merupakan framework utama untuk membangun UI aplikasi.

2. Dart bahasa pemrograman yang digunakan.

3. Provider yang digunakan untuk mengelola data cart secara reaktif.

4. Material design yang digunakan untuk komponen UI seperti appbar, card, button, textfield.

5. Navigator untuk perpindahan antar halaman.

6. Validation untuk validasi input pada halaman checkout.


## Nilai Wajib


1. Add to cart from product list

Fitur ini di gunakan pengguna untuk menambahkan produk ke dalam keranjang dengan menekan tombol Add pada halaman daftar produk. Jika produk sudah ada di dalam cart, maka quantity akan bertambah, bukan membuat item baru.



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/62ff3a01-9a55-4051-97aa-7d2dacf4e45d" />



2. Show cart items dengan quantity

Halaman Cart menampilkan semua item yang sudah ditambahkan, lengkap dengan:


- Nama produk
- Harga
- Quantity
- Subtotal (price × quantity)



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/7910008e-cc36-44d4-9971-59729d6a18bc" />



3. Update quantity (+/-)

Fitur ini dapat menambah atau mengurangi jumlah item menggunakan tombol:
+ untuk menambah
- untuk mengurangi

Jika quantity dikurangi hingga 0, item otomatis terhapus dari cart.



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/d2dc50c1-48a9-4a4c-b4fb-5b32ec927f8f" />



4. Remove items from cart

fitur delete dapat digunakan untuk menghapus item dari cart.



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/45f17ba4-e621-4457-879e-b7f8dcc4fc0e" />



5. Display total price correctly

fitur ini di gunakan untuk menghitung otomatis menggunakan getter totalPrice yang menjumlahkan seluruh subtotal item. Setiap perubahan cart akan langsung memperbarui total karena menggunakan notifyListeners().



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/5e2d8501-e8cf-455d-9432-b4db49e2ab37" />



## Nilai Bonus 

Disini saya juga menggunakan nilai bonus 

1. Search / Filter

fitur yang di gunakan untuk search bar pada halaman product list dan filter dengan produk akan otomatis terfilter berdasarkan nama yang diketik.



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/45c659fb-4121-4f31-b8d0-6e53f06513d0" />



2. Categories

Fitur ini dapat difilter berdasarkan kategori menggunakan dropdown. pengguna dapat memilih kategori tertentu untuk menampilkan produk yang sesuai.



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/f458a3fb-ede0-4131-a2c2-744257360736" />



3. Checkout Page

Checkout ini menggunakan halaman terpisah yang menampilkan:
- Order Summary
- Total harga
- Form (Name, Phone, Address)
- Tombol Place Order
  
Setelah dikonfirmasi:
- Cart otomatis kosong
- Muncul notifikasi



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/06f7aae7-c628-4e32-ae6a-fd8269b2361f" />



<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/4f291d0c-e130-46d5-8337-97f056682ba0" />



## Kesimpulan 

Aplikasi Shopping Cart ini telah memenuhi seluruh nilai wajib yang diminta dan nilai bonus yang di kasih, termasuk implementasi model data, pengelolaan cart, update quantity, remove item, dan perhitungan total harga otomatis. Selain itu, aplikasi juga dilengkapi fitur tambahan seperti search produk, filter kategori, dan halaman checkout lengkap dengan form validasi, yang menunjukkan pemahaman terhadap state management, navigasi antar halaman, serta pemisahan logic dan UI dalam Flutter. Struktur project yang modular dan penggunaan Provider membuat aplikasi lebih rapi, mudah dipahami, dan siap untuk dikembangkan lebih lanjut menjadi aplikasi e-commerce yang lebih kompleks.





