//
//  AuthorizationView.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit
import SnapKit

class AuthorizationView: UIView {
    
    let authorizationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "earthIcon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.text = "Вэлком Бэк!"
        label.font = UIFont(name: "Avenir Next Medium", size: 25)
        label.textAlignment = .center
        return label
    }()
    
    let userNameTF: CustomTextField = {
       let textField = CustomTextField()
        textField.placeholder = "Введи туда-сюда логин"
        return textField
    }()
    
    let passwordTF: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Пароль (тоже введи)"
        textField.isSecureTextEntry = true
        
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.setImage(UIImage(named: "eyeIcon"), for: .normal)
        button.setImage(UIImage(named: "eyeSelectedIcon"), for: .selected)
        button.frame = CGRect(x: CGFloat(textField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(togglePasswordVisible), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        return textField
    }()
    
    let enterButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 11
        let buttonText = "Войти"
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 16)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    let createNewAccountButton: UIButton = {
       let button = UIButton()
       let buttonText = "У меня  еще нет аккаунта"
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 16)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextFields()
        setupUI()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthorizationView: UITextFieldDelegate {
    @objc func togglePasswordVisible(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}

extension AuthorizationView {
    private func setUpTextFields() {
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    func setupUI() {
        addSubview(authorizationImage)
        addSubview(welcomeBackLabel)
        addSubview(userNameTF)
        addSubview(passwordTF)
        addSubview(enterButton)
        addSubview(createNewAccountButton)
    }
    
    func setupConstraints() {
        authorizationImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(195)
            make.width.equalTo(185)
        }
        
        welcomeBackLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authorizationImage.snp.bottom).offset(31)
        }
        
        userNameTF.snp.makeConstraints { make in
            make.top.equalTo(welcomeBackLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        passwordTF.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(userNameTF.snp.bottom).offset(15)
            make.height.equalTo(52)
            make.width.equalTo(360)
        }
        
        enterButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTF.snp.bottom).offset(26)
            make.height.equalTo(50)
        }
        
        createNewAccountButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(enterButton.snp.bottom).offset(28)
            make.height.equalTo(50)
        }
    }
}
