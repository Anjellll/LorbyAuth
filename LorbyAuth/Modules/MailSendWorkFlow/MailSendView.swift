//
//  MailSendView.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class MailSendView: UIView {
    
    lazy var mailTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Выслали письмо со ссылкой для завершения регистрации на example@gmail.com"
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkSpamTitle: UILabel = {
        let label = UILabel()
        label.text = "Если письмо не пришло, не спеши ждать совиную почту - лучше проверь ящик “Спам” \n \n (´｡• ω •｡`)"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir Next Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mailSendImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mailSendIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let repeatMailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Письмо не пришло", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MailSendView {
    private func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    private func setUpSubviews() {
        addSubview(mailTitle)
        addSubview(checkSpamTitle)
        addSubview(mailSendImage)
        addSubview(repeatMailButton)
    }
    
    private func setUpConstraints() {
        mailTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(136)
            make.leading.equalTo(self).offset(31)
            make.trailing.equalTo(self).offset(-31)
        }
        
        checkSpamTitle.snp.makeConstraints { make in
            make.top.equalTo(mailTitle.snp.bottom).offset(24)
            make.leading.equalTo(self).offset(31)
            make.trailing.equalTo(self).offset(-31)
        }
        
        mailSendImage.snp.makeConstraints { make in
            make.top.equalTo(checkSpamTitle.snp.bottom).offset(58)
            make.leading.equalTo(self).offset(75)
            make.trailing.equalTo(self).offset(-75)
        }
        
        repeatMailButton.snp.makeConstraints { make in
            make.top.equalTo(mailSendImage.snp.bottom).offset(56)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(50)
        }
    }
}
