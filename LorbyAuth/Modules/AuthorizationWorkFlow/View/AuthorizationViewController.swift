//
//  AuthorizationViewController.swift
//  LorbyAuth
//
//  Created by anjella on 29/2/24.
//

import UIKit

class AuthorizationViewController: UIViewController {

    private var viewModel: AuthorizationViewModel
    let authView = AuthorizationView()
    
    init(viewModel: AuthorizationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        authView.createNewAccountButton.addTarget(self, action: #selector(newAccountButtonTapped), for: .touchUpInside)
        authView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
    @objc func newAccountButtonTapped() {
        let viewModel = RegisterViewModel()
        let viewController = RegisterViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func enterButtonTapped() {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }

    private func setUpUI() {
        view.addSubview(authView)
        
        authView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

