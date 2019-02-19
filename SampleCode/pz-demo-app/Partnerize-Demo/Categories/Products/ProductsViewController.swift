//
//  ProductsViewController.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 05/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

protocol ProductDetailsRouter: class {
    var selectedItem: ProductPOSO? { get set }
    func openProductDetails(with item: ProductPOSO)
    func presentCheckout(with item: ProductPOSO)
    func handleAddProductToBasket(with item: ProductPOSO)
}

final class ProductsViewController: UIViewController {
    // MARK: - Properties
    private(set) var viewModel: ProductsViewModel?
    @IBOutlet private weak var tableView: UITableView!
    var selectedItem: ProductPOSO?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let viewModel = ProductsViewModel(with: ProductsRepository(),
                                          detailsRouter: self)
        setup(with: viewModel)
    }
    
    // MARK: - Public
    func setup(with viewModel: ProductsViewModel) {
        self.viewModel = viewModel
    }
    
    func openProductDetails(forItemId itemId: String) {
        guard let item = viewModel?.item(for: itemId) else {
            return
        }
        openProductDetails(with: item)
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.prepare()
        tableView.reloadData()        
    }
    
    // MARK: - Private
    private func setupAppearance() {
        navigationItem.title = Constants.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView.dataSource = viewModel
    }
}

extension ProductsViewController: ProductDetailsRouter {
    func openProductDetails(with item: ProductPOSO) {
        selectedItem = item
        performSegue(withIdentifier: Constants.showProductDetailsSegueId, sender: nil)
    }
    
    func presentCheckout(with item: ProductPOSO) {
        performSegue(withIdentifier: Common.SegueIDs.presentCheckout, sender: nil)
    }
    
    func handleAddProductToBasket(with item: ProductPOSO) {
        let basketController = BasketController.shared
        let isProductAdded = basketController.add(item)
        showAddToBasketAlert(addedSuccess: isProductAdded)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedProduct = selectedItem,
            let productDetailsViewController = segue.destination as? ProductDetailsViewController else {
            return
        }        
        productDetailsViewController.setup(with: selectedProduct)
    }
    
    private enum Constants {
        static let showProductDetailsSegueId = "showProductDetails"
        static let title = "Music"
    }
}
