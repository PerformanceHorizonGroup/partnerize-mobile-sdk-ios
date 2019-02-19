//
//  ProductsViewModel.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 07/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

protocol RouterProvider: class {
    var router: ProductDetailsRouter? { get }
}

final class ProductsViewModel: NSObject, RouterProvider {
    // MARK: - Properties
    private let repository: ProductsRepository
    private var categories: [String] = []
    private var items: [String: [ProductPOSO]] = [:]
    
    weak var router: ProductDetailsRouter?
    
    // MARK: - Public
    init(with repository: ProductsRepository, detailsRouter: ProductDetailsRouter) {
        self.repository = repository
        self.router = detailsRouter
        super.init()
    }
    
    func item(for indexPath: IndexPath) -> ProductPOSO? {
        guard indexPath.section < categories.count else {
            return nil
        }
        
        let category = categories[indexPath.section]
        guard let section = items[category], indexPath.item < section.count else {
            return nil
        }
        
        return section[indexPath.item]
    }
    
    func item(for itemId: String) -> ProductPOSO? {
        let allItems = items.values.flatMap({ $0 })
        guard let id = Int(itemId),
            let item = allItems.first(where: { $0.id == id }) else {
            return nil
        }
        return item
    }

    func prepare() {
        let products = repository.getProducts()
        let categories = products.compactMap { $0.category }.sorted()
        
        if let uniqueCategories = Array(NSOrderedSet(array: categories)) as? [String] {
            self.categories = uniqueCategories
            categories.forEach { category in
                let section = products.filter { $0.category == category }
                items[category] = section
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ProductsViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.productsCellIdentifier, for: indexPath)
        let category = categories[indexPath.section]
        
        if let productsCell = cell as? ProductsTableCell, let items = items[category] {
            productsCell.setup(with: items)
            productsCell.routerProvider = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    private enum Constants {
        static let productsCellIdentifier = "ProductsTableCell"
    }
}
