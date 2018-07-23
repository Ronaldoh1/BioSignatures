//
//  DocumentListPresenter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Foundation

import Foundation

class DocumentListPresenter: NSObject {
    
    private weak var view: DocumentListViewType?
    private let router: DocumentListRouterType?
    private let interactor: DocumentListInteractorType?
    
    required init(view: DocumentListViewType, router: DocumentListRouterType, interactor: DocumentListInteractorType) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension DocumentListPresenter: DocumentListPresenterType {
    
    func viewDidAppear() {
        
    }
    
    func signUp(email: String, password: String) {
        
    }
    
}
