//
//  ProductDetailsViewController.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 05/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class ProductDetailsViewController: UITableViewController {
    // MARK: - Properties
    private(set) var product: ProductPOSO?
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var shippingInfoLabel: UILabel!
    @IBOutlet private weak var notesLabel: UILabel!
    
    // MARK: Public
    func setup(with product: ProductPOSO) {
        self.product = product
    }
    
    func updateSubviews() {
        titleLabel.text = product?.title
        descriptionLabel.text = product?.info
        
        if let imageURL = product?.imageURL {
            UIImage.load(from: imageURL) { [weak self] image, error in
                guard let self = self, error == nil else { return }
                self.productImageView.image = image
            }
        }
        
        priceLabel.text = product?.description()
        if let shippingDetails = product?.shippingDetails {
            shippingInfoLabel.text = Constants.shippingInfo + shippingDetails
        }
        if let notes = product?.notes {
            notesLabel.text = Constants.notes + notes
        }
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        updateSubviews()
    }
    
    @IBAction func didSelectBuyNow() {
        let _ = addProductToBasket()
        performSegue(withIdentifier: Common.SegueIDs.presentCheckout, sender: nil)
    }
    
    @IBAction func didSelectAddToBasket() {
        let isProductAdded = addProductToBasket()
        showAddToBasketAlert(addedSuccess: isProductAdded)
    }
    
    // MARK: - Private
    private func addProductToBasket() -> Bool {
        guard let product = product else { return false }
        let basketController = BasketController.shared
        return basketController.add(product)
    }
    
    private func setupAppearance() {
        navigationItem.title = product?.category?.capitalized
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private enum Constants {
        static let shippingInfo = "Shipping Info: "
        static let notes = "Notes: "
    }
}
