//
//  SignatureAssembly.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject
import UIKit

class SignatureAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(SignatureRouterType.self) { (_) in
            return SignatureRouter(container: container)
        }
        
        container.register(SignatureViewType.self) { (_) in
            SignatureViewController()
            }.initCompleted { (resolver, view) in
                view.presenter = resolver.resolve(SignaturePresenterType.self)!
        }
        
        container.register(SignaturePresenterType.self) { (resolver) in
            let view = resolver.resolve(SignatureViewType.self)!
            let router = resolver.resolve(SignatureRouterType.self)!
            let interactor = resolver.resolve(SignatureInteractorType.self)!
            return SignaturePresenter(view: view, router: router, interactor: interactor)
        }
        
        container.register(SignatureInteractorType.self) { (_) in
            return SignatureInteractor()
        }
    }
    
}
