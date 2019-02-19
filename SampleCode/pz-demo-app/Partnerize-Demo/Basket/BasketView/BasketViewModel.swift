//
//  BasketViewModel.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 11/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class BasketViewModel: NSObject {
    private(set) var controller: BasketController
    
    // MARK: - Public
    init(with basketController: BasketController) {
        controller = basketController
    }
}

// MARK: - UITableViewDataSource
extension BasketViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.basketCellIdentifier, for: indexPath)
        
        if let basketCell = cell as? BasketProductCell, var item = controller.item(at: indexPath.row) {
            item.quantity = controller.count(for: item)
            basketCell.setup(with: item)
        }
        
        return cell
    }
    
    private enum Constants {
        static let basketCellIdentifier = "BasketProductCell"
    }
}
