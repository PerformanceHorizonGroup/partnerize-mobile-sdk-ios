//
//  BasketController.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 10/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import Foundation

final class BasketController {
    
    // MARK: - Properties
    private var items = NSCountedSet()
    
    var products: [ProductPOSO] {
        guard let items = Array(items) as? [ProductPOSO] else { return [] }
        
        var results: [ProductPOSO] = []
        for var item in items {
            item.quantity = count(for: item)
            results.append(item)
        }
        
        return results
    }
    
    static let shared = BasketController()
    
    var count: Int {
        return items.count
    }
    
    // MARK: - Public
    @discardableResult func add(_ item: ProductPOSO) -> Bool {
        items.add(item)
        return true
    }
    
    func count(for item: ProductPOSO) -> Int {
        return items.count(for: item)
    }
    
    func remove(_ item: ProductPOSO) {
        items.remove(item)
    }
    
    func clear() {
        items.removeAllObjects()
    }
    
    func item(at index: Int) -> ProductPOSO? {
        guard let itemsArray = Array(items) as? [ProductPOSO],
            itemsArray.count > index else { return nil }
        return itemsArray[index]
    }
}
