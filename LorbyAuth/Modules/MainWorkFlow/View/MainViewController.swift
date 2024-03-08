//
//  MainViewController.swift
//  LorbyAuth
//
//  Created by anjella on 8/3/24.
//

import UIKit

class MainViewController: UIViewController {
 
    private var viewModel: MainViewModel
    
     init(viewModel: MainViewModel) {
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}