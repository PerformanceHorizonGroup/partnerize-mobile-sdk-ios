//
//  AppDelegate.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 05/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit
import Partnerize

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var router: Router!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRouter()
        setupAppearance()        
        Partnerize.isLoggingEnabled = true
        
        return true
    }
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let _ = userActivity.webpageURL?.absoluteString else {
                return false
        }
        
        if let url = try? Partnerize.beginConversion(with: userActivity.webpageURL) {
            handleDeepLink(url)
        }
        
        if let clickRef = Partnerize.conversion?.clickRef {
            showAppClickRef(clickRef)
        }
        
        return true
    }
    
    private func setupRouter() {
        router = Router(with: window)
    }
    
    private func handleDeepLink(_ link: URL) {
        router.navigate(to: link)
    }
    
    private func showAppClickRef(_ clickRef: String) {
        let alertController = UIAlertController(title: "app_clickref value from Partnerize SDK",
                                                message: clickRef,
                                                preferredStyle: .alert)
        
        alertController.view.tintColor = Branding.primaryColor
        
        let dismissAction = UIAlertAction(title: "Amazing!",
                                          style: .cancel,
                                          handler: nil)
        
        alertController.addAction(dismissAction)
        
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
