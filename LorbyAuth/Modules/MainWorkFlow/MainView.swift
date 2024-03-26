//
//  MainView.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class MainView: UIView {
    
    private lazy var welcomeBackTitle: UILabel = {
        let label = UILabel()
        label.text = "С возвращением!"
        label.font = UIFont(name: "Avenir Next Medium", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorby - твой личный репетитор"
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lorbyIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lorbyIcon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private(set) var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        let buttonTitle = "Выйти"
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 16)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    private func setup() {
        setUpSubviews()
        setUpConstraints()
    }
    
    private func setUpSubviews() {
        addSubview(welcomeBackTitle)
        addSubview(subtitleLabel)
        addSubview(lorbyIcon)
        addSubview(logOutButton)
    }
    
    private func setUpConstraints() {
        welcomeBackTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(UIScreen.main.bounds.height * 0.2)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeBackTitle.snp.bottom).offset(10)
        }
        
        lorbyIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(30)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(60)
            make.height.equalTo(lorbyIcon.snp.width)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(60)
            make.width.equalTo(311)
            make.height.equalTo(24)
        }
    }
}




