//
//  MainView.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class MainView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 40)
        label.textAlignment = .center
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Твой личный репетитор"
        label.font = UIFont(name: "MPLUS1p-Regular", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    let viewImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lorby")
        image.contentMode = .scaleAspectFill
        return image
    }()
}
