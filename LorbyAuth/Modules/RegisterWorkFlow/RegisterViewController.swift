//
//  RegisterViewController.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var viewModel: RegisterViewModel
    private var contentView = RegisterView()
    let networkLayer = NetworkLayer.shared
    
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
        configurePasswordValidationHandler()
        contentView.nextButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        contentView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
        contentView.repeatPasswordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
    }
    
    @objc func enterButtonTapped() {
        let viewModel = MailSendViewModel()
        let viewController = MailSendViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func passwordTextFieldDidChange() {
        viewModel.validatePassword(contentView.passwordTextField.text, repeatedPassword: contentView.repeatPasswordTextField.text)
    }
    
    private func configurePasswordValidationHandler() {
        viewModel.passwordValidationResult = { isLengthValid, isAlphanumeric, containsDigit, containsSpecialCharacter, passwordsMatch in
            self.contentView.updatePasswordValidationLabels(
                isLengthValid: isLengthValid,
                isAlphanumeric: isAlphanumeric,
                containsDigit: containsDigit,
                containsSpecialCharacter: containsSpecialCharacter,
                passwordsMatch: passwordsMatch)
        }
    }
}
