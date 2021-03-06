//
//  CatalogInteractor.swift
//  StoreApp
//
//  Created by Гурген on 22.02.2021.
//

import Foundation

class CatalogIneractor {
    weak var presenter: CatalogPresenter?
    
    func fetchProducts() {
        FirebaseHandler().read { (response: [String: Product]?) in
            let products = (response ?? [:]).map { $0.value }
            self.presenter?.didFetchProduct(products: products)
        }
    }
}
