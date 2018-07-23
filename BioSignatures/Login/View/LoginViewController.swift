//
//  ViewController.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit
import Material

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterType?
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    private lazy var emailTextField: UITextField = {
        let textfield = 
        
    }()
    
    private lazy var passwordTextField: UITextField = {
        
        
    }()
    
    private lazy var toggle: UISwitch = {
        
    }()
    
    private lazy var toggleLabel: UILabel = {
        
    }()
    
    private lazy var addSignatureButton: UIButton = {
        let button = UIButton.self
        return button
    }()
    
    private lazy var createAccountButton: UIButton = {
        let
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .red
        
        setupViews()
    }
    
    private func setupViews() {
        
    }
    
    

 
    //MARK: Set up views
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        default: break
        }
        
    }
    
    
    private func setupRegularConstraints() {
        
    }

}

extension LoginViewController: LoginViewType {
    
}

