//
//  ProductCollectionCell.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 09/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class ProductCollectionCell: UICollectionViewCell {
    // MARK: - Properties
    var buyNowAction: (() -> Void)?
    var addToBasketAction: (() -> Void)?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var infoLabel: UILabel!
    
    // MARK: - Public
    func setup(with item: ProductPOSO) {
        if let imageURL = item.imageURL {
            UIImage.load(from: imageURL) { [weak self] image, error in
                guard let self = self, error == nil else { return }
                self.imageView.image = image
            }
        }
        
        infoLabel.text = item.description()
    }
    
    @IBAction func didSelectBuyNow() {
        buyNowAction?()
    }
    
    @IBAction func didSelectAddToBasket() {
        addToBasketAction?()
    }
}
