//
//  CatalogViewController.swift
//  StoreApp
//
//  Created by Гурген on 22.02.2021.
//

import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var presenter: CatalogPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.nibName)
        presenter?.viewLoaded()
        presenter?.subscribe(collectionView: collectionView )
        title = "Каталог"
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func reloadView(){
        collectionView.reloadData()
    }
}
