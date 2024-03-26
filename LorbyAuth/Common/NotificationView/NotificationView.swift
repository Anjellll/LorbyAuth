//
//  NotificationView.swift
//  LorbyAuth
//
//  Created by anjella on 25/3/24.
//

import UIKit
import SnapKit

class NotificationView: UIView {
    
     lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Regular", size: 16)
        label.text = "Неверный логин или пароль"
        label.textColor = .red
        label.textAlignment = .left
        label.backgroundColor = .white
        label.layer.cornerRadius = 12
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        addSubview(notificationLabel)
        
        notificationLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(-16)
        }
    }
}


