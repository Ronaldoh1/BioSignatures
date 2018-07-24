//
//  LoginPresenter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Foundation

class LoginPresenter: NSObject {

    private weak var view: LoginViewType?
    private let router: LoginRouterType?
    private let interactor: LoginInteractorType?
    
    required init(view: LoginViewType, router: LoginRouterType, interactor: LoginInteractorType) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension LoginPresenter: LoginPresenterType {
    
    func viewDidAppear() {
        
    }
    
    func signUp(email: String, password: String) {
        
    }
    
    func presentSignatureViewController() {
        router?.presentSignatureViewController(sender: view as! LoginViewController)
    }
    
}
