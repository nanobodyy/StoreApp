//
//  CatalogAssembly.swift
//  StoreApp
//
//  Created by Гурген on 23.02.2021.
//

import UIKit

class CatalogAssembly {
    func assembly() -> UIViewController {
        let vc = CatalogViewController()
        let presenter = CatalogPresenter()
        let interactor = CatalogIneractor()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.presenter = presenter
        return vc
    }
}
