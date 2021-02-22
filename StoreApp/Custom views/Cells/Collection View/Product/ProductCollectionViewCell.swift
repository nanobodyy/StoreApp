//
//  ProductCollectionViewCell.swift
//  StoreApp
//
//  Created by Гурген on 22.02.2021.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell, NibLoadable {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    
    func configure(by product: Product) {
        titleLabel.text = product.name
        priceLabel.text = "\(product.price ?? 0) $"
        ratingLabel.text = "Рейтинг: \(product.rating ?? 0)"
        imageView.kf.setImage(with: URL(string: product.imageUrl ?? "") )
    }
}

