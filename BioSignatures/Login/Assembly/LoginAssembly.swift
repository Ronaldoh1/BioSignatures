//
//  LoginAssembly.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject

class LoginAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LoginRouterType.self) { (_) in
            return LoginRouter(container: container)
        }
        
        container.register(LoginViewType.self) { (_) in
            LoginViewController()
            }.initCompleted { (resolver, view) in
                view.presenter = resolver.resolve(LoginPresenterType.self)!
        }

        container.register(LoginPresenterType.self) { (resolver) in
            let view = resolver.resolve(LoginViewType.self)!
            let router = resolver.resolve(LoginRouterType.self)!
            let interactor = resolver.resolve(LoginInteractorType.self)!
            return LoginPresenter(view: view, router: router, interactor: interactor)
        }
        
        container.register(LoginInteractorType.self) { (_) in
            return LoginInteractor()
        }
    }
    
}
