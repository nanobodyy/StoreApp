//
//  CatalogPresenter.swift
//  StoreApp
//
//  Created by Гурген on 22.02.2021.
//

import UIKit

class CatalogPresenter {
    weak var view: CatalogViewController?
    var interactor: CatalogIneractor?
    private let dataSourcec: CatalogDataSource = .init()
    
    func didFetchProduct(products: [Product]) {
        dataSourcec.load(products: products)
        view?.reloadView()
    }
    
    func viewLoaded() {
        interactor?.fetchProducts()
    }
    
    func subscribe(collectionView: UICollectionView) {
        collectionView.dataSource = dataSourcec
        collectionView.delegate = dataSourcec
    }
}
