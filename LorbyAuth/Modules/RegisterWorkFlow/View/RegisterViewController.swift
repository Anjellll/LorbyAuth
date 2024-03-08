//
//  RegisterViewController.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var viewModel: RegisterViewModel
    let registerView = RegisterView()
    
     init(viewModel: RegisterViewModel) {
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        registerView.nextButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
    @objc func enterButtonTapped() {
        let viewModel = MailSendViewModel()
        let viewController = MailSendViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setUp() {
        view.addSubview(registerView)
        
        registerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
