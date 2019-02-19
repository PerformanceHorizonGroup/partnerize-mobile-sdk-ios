//
//  Router.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 23/01/2019.
//  Copyright © 2019 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class Router {
    private let window: UIWindow
    private var tabBarController: UITabBarController? {
        guard let controller = window.rootViewController as? UITabBarController else {
            return nil
        }
        return controller
    }
    
    init?(with window: UIWindow?) {
        guard let window = window else {
            return nil
        }
        self.window = window
    }
    
    // MARK: - Public
    func navigate(to url: URL) {
        guard let screen = screen(for: url) else {
            return
        }
        navigate(to: screen, id: url.lastPathComponent)
    }
    
    // MARK: - Private
    private func navigate(to screen: Screen, id: String) {
        guard let tabBarController = tabBarController else {
            return
        }
        
        switch screen {
        case .productDetails:
            tabBarController.selectedIndex = 0
            
            if let navigationController = tabBarController.selectedViewController as? UINavigationController {
                navigationController.popToRootViewController(animated: false)
                
                if let productsViewController = navigationController.topViewController as? ProductsViewController {
                    productsViewController.openProductDetails(forItemId: id)
                }
            }
        }
    }
    
    private func screen(for url: URL) -> Screen? {
        let screenIdentifier = url.deletingLastPathComponent().lastPathComponent
        return Screen(rawValue: screenIdentifier)
    }
    
    private enum Screen: String {
        case productDetails = "product"
    }
}
