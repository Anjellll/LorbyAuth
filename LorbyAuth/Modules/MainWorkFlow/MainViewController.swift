//
//  MainViewController.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class MainViewController: UIViewController {
 
    private var viewModel: MainViewModel
    let contentView = MainView()
    
     init(viewModel: MainViewModel) {
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        contentView.logOutButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func exitButtonTapped() {
        let viewModel = AuthorizationViewModel()
        let viewController = AuthorizationViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
