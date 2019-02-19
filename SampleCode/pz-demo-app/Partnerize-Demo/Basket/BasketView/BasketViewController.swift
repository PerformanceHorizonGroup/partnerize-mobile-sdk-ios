//
//  BasketViewController.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 05/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

final class BasketViewController: UIViewController {
    // MARK: - Properties
    static let tabIndex = 1
    @IBOutlet private weak var tableView: UITableView!
    private(set) var viewModel: BasketViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let viewModel = BasketViewModel(with: BasketController.shared)
        setup(with: viewModel)
    }

    // MARK: - Public
    func setup(with viewModel: BasketViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Private
    private func setupTableView() {
        tableView.dataSource = viewModel
    }
    
    @IBAction func didSelectPay() {
        performSegue(withIdentifier: Constants.presentCheckoutSegueId, sender: nil)
    }
    
    @IBAction func didSelectAction(_ sender: Any) {
        showTestOptions()
    }
    
    private enum Constants {
        static let presentCheckoutSegueId = "presentCheckout"
    }
}
