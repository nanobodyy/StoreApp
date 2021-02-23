//
//  CatalogDataSource.swift
//  StoreApp
//
//  Created by Гурген on 22.02.2021.
//

import UIKit

class CatalogDataSource: NSObject {
    private let numberOfColums: CGFloat = 2
    private let spacing: CGFloat = 16
    
    private(set) var products: [Product] = []
    
    func load(products: [Product]) {
        self.products = products
    }
}

extension CatalogDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.nibName, for: indexPath) as! ProductCollectionViewCell
        
        let product = products[indexPath.row]
        cell.configure(by: product)
        
        return cell
    }
    
     
}

extension CatalogDataSource : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let mainWidth = collectionView.frame.width
        let width =  (mainWidth - spacing * 2 - spacing * (numberOfColums - 1)) / numberOfColums
        let aspectRatio: CGFloat = 3/2
        let height = width * aspectRatio
        let size: CGSize = .init(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }//отступ между элементами
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }//отступ по вертикали
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets: UIEdgeInsets = .zero
        insets.left = spacing
        insets.right = spacing
        return insets
    }//отступ по бокам
}
