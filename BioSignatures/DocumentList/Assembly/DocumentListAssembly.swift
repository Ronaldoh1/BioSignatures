//
//  DocumentListAssembly.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject

class DocumentListAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DocumentListRouterType.self) { (_) in
            return DocumentListRouter(container: container)
        }
        
        container.register(DocumentListViewType.self) { (_) in
            DocumentListViewController()
            }.initCompleted { (resolver, view) in
                view.presenter = resolver.resolve(DocumentListPresenterType.self)!
        }
        
        container.register(DocumentListPresenterType.self) { (resolver) in
            let view = resolver.resolve(DocumentListViewType.self)!
            let router = resolver.resolve(DocumentListRouterType.self)!
            let interactor = resolver.resolve(DocumentListInteractorType.self)!
            return DocumentListPresenter(view: view, router: router, interactor: interactor)
        }
        
        container.register(DocumentListInteractorType.self) { (_) in
            return DocumentListInteractor()
        }
    }
    
}

