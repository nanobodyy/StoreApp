//
//  CatalogPresenter.swift
//  StoreApp
//
//  Created by Гурген on 22.02.2021.
//

import Foundation

class CatalogPresenter {
    weak var view: CatalogViewController?
    var interactor: CatalogIneractor?
    private let dataSourcec: CatalogDataSource = .init()
}
