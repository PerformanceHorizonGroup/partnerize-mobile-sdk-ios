//
//  UIImage+Loading.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 09/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func load(from url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let imageData = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let image = UIImage(data: imageData) {
                        completion(image, nil)
                    }
                }

            } catch let error {
                dump("UIImage load() error = \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}
