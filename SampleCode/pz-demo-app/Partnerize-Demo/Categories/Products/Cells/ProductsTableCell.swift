//
//  ProductsTableCell.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 07/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class ProductsTableCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var collectionView: UICollectionView!
    private(set) var items: [ProductPOSO]?

    weak var routerProvider: RouterProvider?
    
    // MARK: - Public
    func setup(with items: [ProductPOSO]) {
        self.items = items
        setupCollectionView()
        collectionView.reloadData()
    }
    
    // MARK : - Private
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ProductsTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let items = items else { return 0 }
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.productCellIdentifier, for: indexPath)
        
        if let collectionCell = cell as? ProductCollectionCell,
            let item = items?[indexPath.item],
            let router = routerProvider?.router {
            
            collectionCell.setup(with: item)
            collectionCell.buyNowAction = { [weak router] in
                let basketController = BasketController.shared
                basketController.add(item)
                
                router?.presentCheckout(with: item)
            }
            collectionCell.addToBasketAction = { [weak router] in
                router?.handleAddProductToBasket(with: item)
            }
        }
        
        return cell
    }
    
    private enum Constants {
        static let productCellIdentifier = "ProductCollectionCell"        
    }
}

extension ProductsTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = items?[indexPath.item], let router = routerProvider?.router else { return }
        router.openProductDetails(with: item)
    }
}
