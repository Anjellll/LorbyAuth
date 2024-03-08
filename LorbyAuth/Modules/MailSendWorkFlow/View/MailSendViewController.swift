//
//  MailSendViewController.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class MailSendViewController: UIViewController {
    
    private var viewModel: MailSendViewModel
    let mailSendView = MailSendView()
    
     init(viewModel: MailSendViewModel) {
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
    }
    
    private func setUp() {
        view.addSubview(mailSendView)
        
        mailSendView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
