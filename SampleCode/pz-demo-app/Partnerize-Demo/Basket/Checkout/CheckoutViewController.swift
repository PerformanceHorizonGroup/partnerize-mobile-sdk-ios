//
//  CheckoutViewController.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 05/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit
import Partnerize

final class CheckoutViewController: UITableViewController {
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.checkoutTitle
    }
    
    @IBAction func didSelectCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didSelectPlaceOrder(_ sender: UIBarButtonItem) {
        prepareConversion()
        
        Partnerize.completeConversion { [weak self] success, error in
            let message = success ? "Conversion Success" : error?.localizedDescription
            self?.dismiss(animated: true) {
                self?.showAlert(with: message)
            }
        }
        
        BasketController.shared.clear()
    }
    
    func prepareConversion() {
        let conversion = Partnerize.conversion
        
        let products = BasketController.shared.products
        let product = products.first

        conversion?.pubRef = product?.pubRef
        conversion?.adRef = product?.adRef
        conversion?.country = product?.country
        conversion?.currency = product?.currency
        conversion?.conversionRef = product?.conversionRef
        conversion?.custRef = product?.custRef
        conversion?.voucher = product?.voucher
        conversion?.metadata = product?.metadata
        
        let conversionItems = products.compactMap { ConversionItem(value: $0.price,
                                                                category: $0.category,
                                                                quantity: String($0.quantity),
                                                                sku: String($0.id ?? 0),
                                                                metadata: ["artist": $0.title ?? "", "song": $0.info ?? ""]) }        
        conversion?.items = conversionItems
    }
    
    // MARK: - Private
    private func showAlert(with title: String? = nil) {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
        
        let alertController = UIAlertController(title: title,
                                                message: Constants.purchaseCompleteMessage,
                                                preferredStyle: .alert)
        
        alertController.view.tintColor = Branding.primaryColor
        
        let dismissAction = UIAlertAction(title: Constants.dismissTitle,
                                          style: .cancel,
                                          handler: nil)
        
        alertController.addAction(dismissAction)

        rootViewController.present(alertController, animated: true, completion: nil)
    }
    
    private enum Constants {
        static let checkoutTitle = "Checkout"
        static let purchaseCompleteMessage = "Purchase successful!"
        static let dismissTitle = "OK"
    }
}

extension CheckoutViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let products = BasketController.shared.products
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "CheckoutCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        }
        
        guard let tableCell = cell,
            var model = BasketController.shared.item(at: indexPath.item) else { return UITableViewCell() }
       
        model.quantity = BasketController.shared.count(for: model)
        
        tableCell.textLabel?.text = model.title
        
        if model.quantity > 1 {
            tableCell.detailTextLabel?.text = "Quantity: \(model.quantity) x £\(model.price ?? "0.00")"
        }
        else {
            tableCell.detailTextLabel?.text = "£\(model.price ?? "0.00")"
        }

        return tableCell
    }
}
