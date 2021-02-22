//
//  CatalogViewController.swift
//  StoreApp
//
//  Created by Гурген on 22.02.2021.
//

import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let numberOfColums: CGFloat = 2
    private let spacing: CGFloat = 16
    
    var presenter: CatalogPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.nibName)
    }
}
