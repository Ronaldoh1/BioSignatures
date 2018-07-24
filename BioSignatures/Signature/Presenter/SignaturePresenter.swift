//
//  SignaturePresenter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Foundation

class SignaturePresenter: NSObject {
    
    private weak var view: SignatureViewType?
    private let router: SignatureRouterType?
    private let interactor: SignatureInteractorType?
    
    required init(view: SignatureViewType, router: SignatureRouterType, interactor: SignatureInteractorType) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension SignaturePresenter: SignaturePresenterType {
    
    func viewDidAppear() {
        
    }
    
    func signUp(email: String, password: String) {
        
    }
    
}
