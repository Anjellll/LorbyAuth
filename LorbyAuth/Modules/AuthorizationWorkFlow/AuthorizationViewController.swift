//
//  AuthorizationViewController.swift
//  LorbyAuth
//
//  Created by anjella on 29/2/24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private var viewModel: AuthorizationViewModel
    let contentView = AuthorizationView()
    
    init(viewModel: AuthorizationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.delegate = self
        contentView.createNewAccountButton.addTarget(self, action: #selector(newAccountButtonTapped), for: .touchUpInside)
        contentView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
    @objc func newAccountButtonTapped() {
        let registerViewModel = RegisterViewModel()
        let viewController = RegisterViewController(viewModel: registerViewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func enterButtonTapped() {
        viewModel.loginButtonTapped(login: contentView.userNameTF.text, password: contentView.passwordTF.text)
    }
}

extension AuthorizationViewController: AuthorizationViewDelegate {
    func authenticationDidComplete() {
        DispatchQueue.main.async {
            let viewModel = MailSendViewModel()
            let entryVC = MailSendViewController(viewModel: viewModel)
            entryVC.modalPresentationStyle = .fullScreen
            self.present(entryVC, animated: true)
        }
    }
    
    func showTopNotification(message: String) {
        let notificationView = NotificationView()
        notificationView.notificationLabel.text = message
        view.addSubview(notificationView)
        
        notificationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
        
        notificationView.transform = CGAffineTransform(translationX: 0, y: -notificationView.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            notificationView.transform = .identity
        }) { _ in
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.5, animations: {
                notificationView.alpha = 0
            }) { _ in
                notificationView.removeFromSuperview()
            }
        }
    }
}

extension AuthorizationViewController: NetworkLayerDelegate {
    func authenticationDidComplete(success: Bool) {
        if success {
            DispatchQueue.main.async {
                let viewModel = MailSendViewModel()
                let entryVC = MailSendViewController(viewModel: viewModel)
                entryVC.modalPresentationStyle = .fullScreen
                self.present(entryVC, animated: true)
            }
        } else {
            DispatchQueue.main.async {
                self.showTopNotification(message: "Ошибка")
            }
        }
    }
}
