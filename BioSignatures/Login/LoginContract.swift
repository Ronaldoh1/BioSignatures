//
//  LoginContract.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit

protocol LoginViewType: class {
    
    var presenter: LoginPresenterType? { get set }
    
    
}

protocol LoginInteractorType: class {
    
    
}

protocol LoginPresenterType: class {
    
    func viewDidAppear()
    func signUp(email: String, password: String)
    func presentSignatureViewController()

    
    
}

protocol LoginRouterType: class {
    
    func presentLoginViewController(in window: UIWindow)
    
    func presentSignatureViewController(sender: UIViewController)
    
}
