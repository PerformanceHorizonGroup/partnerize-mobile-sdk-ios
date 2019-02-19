//
//  BasketProductCell.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 10/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class BasketProductCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var productLabel: UILabel!
    @IBOutlet private weak var productInfoLabel: UILabel!
    
    // MARK: - Public
    func setup(with product: ProductPOSO) {
        productLabel.text = product.title

        if product.quantity > 1 {
            productInfoLabel.text = "Quantity: \(product.quantity) x £\(product.price ?? "0.00")"
        }
        else {
            productInfoLabel.text = "£\(product.price ?? "0.00")"
        }
    }
}
