//
//  RegisterView.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class RegisterView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Создать аккаунт \n Lorby"
        label.font = UIFont(name: "Avenir Next Medium", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let mailAddressTF: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Avenir Next Medium", size: 16)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Введи адрес почты",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "Avenir Next Medium", size: 16),
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        return textField
    }()
    
    private let loginTF: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Avenir Next Medium", size: 16)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Придумай логин",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "Avenir Next Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    private let passwordTF: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Avenir Next Medium", size: 16)
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "Создай пароль",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "Avenir Next Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
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
    
    let passwordLengthLabel: UILabel = {
        let label = UILabel()
        label.text = "· От 8 до 15 символов"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Medium", size: 12)
        label.textColor = .gray
        return label
    }()
    
    let alphanumericLabel: UILabel = {
        let label = UILabel()
        label.text = "· Строчные и прописные буквы"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Medium", size: 12)
        label.textColor = .gray
        return label
    }()
    
    let numericDigitLabel: UILabel = {
        let label = UILabel()
        label.text = "· Минимум 1 цифра"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Medium", size: 12)
        label.textColor = .gray
        return label
    }()
    
    let specialCharacterLabel: UILabel = {
        let label = UILabel()
        label.text = "· Минимум 1 спецсимвол (!, #, $...)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Medium", size: 12)
        label.textColor = .gray
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let repeatPasswordTF: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Avenir Next Medium", size: 16)
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "Повтори пароль",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "Avenir Next Medium", size: 16),
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.setImage(UIImage(named: "eyeIcon"), for: .normal)
        button.setImage(UIImage(named: "eyeSelectedIcon"), for: .selected)
        button.frame = CGRect(x: CGFloat(textField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(toggleRepeatPasswordVisible), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        return textField
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterView: UITextFieldDelegate {
    @objc func togglePasswordVisible(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    @objc func toggleRepeatPasswordVisible(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        repeatPasswordTF.isSecureTextEntry = !repeatPasswordTF.isSecureTextEntry
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}

extension RegisterView {
    private func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    private func setUpSubviews() {
        addSubview(titleLabel)
        addSubview(mailAddressTF)
        addSubview(loginTF)
        addSubview(passwordTF)
        addSubview(stackView)
        stackView.addArrangedSubview(passwordLengthLabel)
        stackView.addArrangedSubview(alphanumericLabel)
        stackView.addArrangedSubview(numericDigitLabel)
        stackView.addArrangedSubview(specialCharacterLabel)
        addSubview(repeatPasswordTF)
        addSubview(nextButton)
    }
    
    private func setUpConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.leading.equalTo(self).offset(51)
            make.trailing.equalTo(self).offset(-51)
            make.height.equalTo(70)
        }
        
        mailAddressTF.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(52)
        }
        
        loginTF.snp.makeConstraints { make in
            make.top.equalTo(mailAddressTF.snp.bottom).offset(14)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(52)
        }
        
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(loginTF.snp.bottom).offset(14)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(52)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(8)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(80)
        }
        
        repeatPasswordTF.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(14)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTF.snp.bottom).offset(24)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(52)
        }
    }
}




