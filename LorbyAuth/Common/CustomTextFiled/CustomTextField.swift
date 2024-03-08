//
//  CustomTextField.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        setUpUI()
      }

      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setUpUI()
      }
    
       private func setUpUI() {
           layer.cornerRadius = 12
           autocorrectionType = .no
           autocapitalizationType = .none
           clearButtonMode = .whileEditing
           backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1.0)
           textColor = .black
           font = UIFont(name: "Avenir Next", size: 16)
    }
}
