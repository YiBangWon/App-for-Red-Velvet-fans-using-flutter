// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product> [
      Product(
        name: '슬기호텔1',
        assetName: 'assets/seulgi1.jpg',
        description: '1슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨',
        location: '한동대학교 벧엘관 1호',
        phone: '-1-12-12-1-1-4-1-4-21-4-124-1-'
      ),
      Product(
        name: '슬기호텔2',
        assetName: 'assets/seulgi2.jpg',
        description: '2슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨',
        location: '한동대학교 벧엘관 2호',
        phone: '-1-12-12-1-1-4-1-4-21-4-124-1-'
      ),
      Product(
        name: '슬기호텔3',
        assetName: 'assets/seulgi3.jpg',
        description: '3슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨',
        location: '한동대학교 벧엘관 3호',
        phone: '-1-12-12-1-1-4-1-4-21-4-124-1-'
      ),
      Product(
        name: '슬기호텔4',
        assetName: 'assets/seulgi4.jpg',
        description: '4슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨',
        location: '한동대학교 벧엘관 4호',
        phone: '-1-12-12-1-1-4-1-4-21-4-124-1-'
      ),
      Product(
        name: '슬기호텔5',
        assetName: 'assets/seulgi5.jpg',
        description: '5슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨',
        location: '한동대학교 벧엘관 5호',
        phone: '-1-12-12-1-1-4-1-4-21-4-124-1-'
      ),
      Product(
        name: '슬기호텔6',
        assetName: 'assets/seulgi6.jpg',
        description: '6슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨'
        '슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨슬기짱짱맨',
        location: '한동대학교 벧엘관 6호',
        phone: '-1-12-12-1-1-4-1-4-21-4-124-1-'
      ),
    ];
    return allProducts;
  }
}
