//
//  DocumentDetailsPresenter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Foundation

class  DocumentDetailsPresenter: NSObject {
    
    private weak var view:  DocumentDetailsViewType?
    private let router:  DocumentDetailsRouterType?
    private let interactor:  DocumentDetailsInteractorType?
    
    required init(view:  DocumentDetailsViewType, router:  DocumentDetailsRouterType, interactor:  DocumentDetailsInteractorType) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  DocumentDetailsPresenter:  DocumentDetailsPresenterType {
    
    func viewDidAppear() {
        
    }
    
    func signUp(email: String, password: String) {
        
    }
    
}
