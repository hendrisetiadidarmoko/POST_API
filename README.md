## Tentang POST API

POST API merupakan sistem Point of Sale yang dibangun dengan menggunakan framework Laravel. Sistem yang memiliki 3 database yaitu :

● Products (with inventory)
● Sales transactions
● Transaction items

## Cara Menjalankan Project POST API

1. Clone Repository
    `https://github.com/hendrisetiadidarmoko/POST_API.git`
2. Install Dependency
    `Composer Install`
3. Clone file env
    `cp .env.example .env`
4. Generate key
    `php artisan key:generate`
5. Sesuaikan .env dengan Konfigurasi Database
    ```
    DB_CONNECTION=pgsql
    DB_HOST=127.0.0.1
    DB_PORT=5432
    DB_DATABASE=POS
    DB_USERNAME=postgres
    DB_PASSWORD=
    ```
    
6. Migrasi Database (jika belum import database diatas menggunakan postgresql)
    `php artisan migrate`
    atau
    `php artisan migrate --seed`
7. Run Server
    `php artisan serve`

## Endpoint
Endpoint ini dapat digunakan menggunakan aplikasi postman untuk menjalankan API tersebut

#### 1. Products
- `GET /product` -> menampilkan semua produk
- `POST /product` -> menyimpan produk
- `GET /product/{id}` -> menampilkan produk menurut id
- `PUT /product/{id}` -> mengedit produk menurut id
- `DELETE /product/{id}` -> menghapus produk menurut id

#### 2. Sales transactions
- `GET /sales` -> menampilkan semua sale
- `GET /sales/{id}` -> menampilkan sales menurut id

#### 3. Transaction items
- `GET /transaction-items` -> menampilkan semua transaksi item
- `GET /transaction-items/{id}` -> menampilkan transaksi item menurut id

#### 4. Transaction
- `GET /transaction-show` -> menampilkan semua transaksi
- `GET /transaction-show/{id}` -> menampilkan transaksi menurut id
- `POST /transaction` -> menyimpan transaksi

##  Penggunaan Endpoint POST dan PUT

#### 1. Products
- `POST /product`
Buka Postman bagian colection -> ganti method POST -> isi URL -> buka body -> raw. Berikut merupakan contoh isinya :
```
{
  "name": "coklat",
  "stock": 10,
  "price": 1000
}
```
- `PUT /product/{id}`
Buka Postman bagian colection -> ganti method POST -> isi URL -> buka body -> raw. Berikut merupakan contoh isinya :
```
{
  "name": "coklat",
  "stock": 15,
  "price": 1000
}
```
#### 4. Transaction
- `POST /transaction`
Buka Postman bagian colection -> ganti method POST -> isi URL -> buka body -> raw. Berikut merupakan contoh isinya :
```
{
  "cashier_name": "adi",
  "payment": "cash",
  "product": [
    {
      "id": 1,
      "quantity": 2
    },
    {
      "id": 3,
      "quantity": 1
    }
  ]
}

```
