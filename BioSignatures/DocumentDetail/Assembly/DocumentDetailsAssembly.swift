//
//  DocumentListAssembly.swift
//  BioDocumentDetailss
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject

class DocumentDetailsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DocumentDetailsRouterType.self) { (_) in
            return DocumentDetailsRouter(container: container)
        }
        
        container.register(DocumentDetailsViewType.self) { (_) in
            DocumentDetailsViewController()
            }.initCompleted { (resolver, view) in
                view.presenter = resolver.resolve(DocumentDetailsPresenterType.self)!
        }
        
        container.register(DocumentDetailsPresenterType.self) { (resolver) in
            let view = resolver.resolve(DocumentDetailsViewType.self)!
            let router = resolver.resolve(DocumentDetailsRouterType.self)!
            let interactor = resolver.resolve(DocumentDetailsInteractorType.self)!
            return DocumentDetailsPresenter(view: view, router: router, interactor: interactor)
        }
        
        container.register(DocumentDetailsInteractorType.self) { (_) in
            return DocumentDetailsInteractor()
        }
    }
    
}
