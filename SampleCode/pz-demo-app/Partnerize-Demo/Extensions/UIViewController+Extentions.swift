//
//  UIViewController+Extentions.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 28/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit
import Partnerize

extension UIViewController {
    func showAddToBasketAlert(addedSuccess: Bool = true) {
        let alertController = UIAlertController(title: addedSuccess ? Common.Texts.addedToBasketSuccessTitle : Common.Texts.addedToBasketErrorTitle,
                                                message: addedSuccess ? nil : Common.Texts.addedToBasketErrorMessage,
                                                preferredStyle: .alert)
        
        alertController.view.tintColor = Branding.primaryColor
        
        let goToBasketAction = UIAlertAction(title: Common.Texts.goToBasket,
                                             style: .default) { [weak self] action in
            guard let self = self else { return }
            self.tabBarController?.selectedIndex = BasketViewController.tabIndex
        }
        
        let dismissAction = UIAlertAction(title: Common.Texts.dismiss,
                                          style: .cancel,
                                          handler: nil)
        
        alertController.addAction(goToBasketAction)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showTestOptions() {
        let alertController = UIAlertController(title: Common.Texts.testOptionsTitle,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        
        alertController.view.tintColor = Branding.primaryColor
        
        let changeSaaSAction = UIAlertAction(title: Common.Texts.changeSaaSURLTitle,
                                             style: .default) { [weak self] action in
            guard let self = self else { return }
            self.showChangeURLAlert()
        }
        
        let updateProductsAction = UIAlertAction(title: Common.Texts.updateProductsTitle,
                                                 style: .default) { [weak self] _ in
                                                    
            guard let self = self else { return }
            self.showLoadProductsURLAlert()
        }
        
        let dismissAction = UIAlertAction(title: Common.Texts.cancel,
                                          style: .cancel,
                                          handler: nil)
        

        
        alertController.addAction(changeSaaSAction)
        alertController.addAction(updateProductsAction)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showChangeURLAlert() {
        let alertController = UIAlertController(title: Common.Texts.changeSaaSURLTitle,
                                                message: nil,
                                                preferredStyle: .alert)
        

        alertController.addTextField { textField in
            textField.text = Constants.trackingURLTextFieldText
        }
        
        alertController.addAction(UIAlertAction(title: Common.Texts.dismiss,
                                                style: .default, handler: { [weak alertController] (_) in
                                                    
            guard let textField = alertController?.textFields?[0],
                let textFieldText = textField.text else { return }

            let url = URL(string: textFieldText)
            Partnerize.perform(Selector(("setServiceURL:")), with: url)
        }))
        
        let dismissAction = UIAlertAction(title: Common.Texts.cancel,
                                          style: .cancel,
                                          handler: nil)
        alertController.addAction(dismissAction)

        present(alertController, animated: true, completion: nil)
    }
    
    func showLoadProductsURLAlert() {
        let alertController = UIAlertController(title: Common.Texts.updateProductsTitle,
                                                message: nil,
                                                preferredStyle: .alert)
        
        
        alertController.addTextField { textField in
            textField.text = Constants.partnerURLTextFieldText
        }
        
        alertController.addAction(UIAlertAction(title: Common.Texts.dismiss,
                                                style: .default, handler: { [weak alertController] (_) in
                                                    
            guard let textField = alertController?.textFields?[0],
                let textFieldText = textField.text else { return }

            ProductsRepository.downloadProducts(from: URL(string: textFieldText))
        }))
        
        let dismissAction = UIAlertAction(title: Common.Texts.cancel,
                                          style: .cancel,
                                          handler: nil)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)

    }
    
    private enum Constants {
        static let trackingURLTextFieldText = "https://pzt"
        static let partnerURLTextFieldText = "https://pzp"
    }
}
