//
//  ProductsRepository.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 06/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class ProductsRepository {
    
    private var localProductsURL: URL? {
        guard let documentsPath = Constants.documentsPath else { return nil }

        let fileManager = FileManager.default
        let productsPath = URL(fileURLWithPath: documentsPath).appendingPathComponent("\(Constants.productsJSON).json")
        
        guard fileManager.fileExists(atPath: productsPath.path) else { return nil }
        
        return productsPath
    }
    
    // MARK: - Public
    func getProducts() -> [ProductPOSO] {
        var productsURL: URL
        if let url = localProductsURL {
            productsURL = url
        }
        else if let url = ProductsRepository.copyDefaultProductsToDocuments() {
            productsURL = url
        }
        else {
            return []
        }
        
        let products: Products
        do {
            let productsData = try Data(contentsOf: productsURL)
            let decoder = JSONDecoder()
            products = try decoder.decode(Products.self, from: productsData)
            
        } catch let error {
            dump("getProducts() error = \(error)")
            return []
        }
        
        guard let allProducts = products.products else { return [] }
        
        var results: [ProductPOSO] = []
        for var product in allProducts {
            product.pubRef = products.pubRef
            product.adRef = products.adRef
            product.country = products.country
            product.currency = products.currency
            product.conversionRef = products.conversionRef
            product.custRef = products.custRef
            product.voucher = products.voucher
            product.metadata = products.metadata
            results.append(product)
        }
        return results
    }
    
    static func downloadProducts(from serviceURL: URL?) {
        guard let documentsPath = Constants.documentsPath,
            let url = serviceURL?.appendingPathComponent("/data/products") else {
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let productsData = try Data(contentsOf: url)
                let fullDestinationURL = URL(fileURLWithPath: documentsPath).appendingPathComponent("\(Constants.productsJSON).json")
                try productsData.write(to: fullDestinationURL)
                
            } catch let error {
                dump("downloadProductsToDocuments() error = \(error)")
            }
        }
    }
    
    private static func copyDefaultProductsToDocuments() -> URL? {
        guard let bundledProductsPath = Constants.productsJSONPath,
            let documentsPath = Constants.documentsPath else { return nil }

        let fileManager = FileManager.default
        let fullDestinationURL = URL(fileURLWithPath: documentsPath).appendingPathComponent("\(Constants.productsJSON).json")
        
        do {
            try fileManager.copyItem(atPath: bundledProductsPath, toPath: fullDestinationURL.path)
            return fullDestinationURL
            
        } catch  {
            dump("copyDefaultProductsToDocuments() error = \(error)")
            return nil
        }
    }
    
    private enum Constants {
        static let productsJSON = "products"
        static let productsJSONPath = Bundle.main.path(forResource: Constants.productsJSON, ofType: "json")
        static let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }
}
