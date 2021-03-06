//
//  LoginRouter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject
import UIKit

class LoginRouter {
    
    private let container: Container
    
   required init(container: Container) {
        self.container = container
    }
    
}

extension LoginRouter: LoginRouterType {
    
    func presentLoginViewController(in windwow: UIWindow) {
        guard let controller = container.resolve(LoginViewType.self) as? LoginViewController else { return }        
        let rootViewController = UINavigationController(rootViewController: controller)
        rootViewController.navigationBar.isHidden = true

        windwow.makeKeyAndVisible()
        windwow.rootViewController = rootViewController
    }
    
    func presentSignatureViewController(sender: UIViewController) {
        guard let router = container.resolve(SignatureRouterType.self) as? SignatureRouter else { return }
        router.presentSignatureViewController(sender: sender)
    }
    
    func presentDocumentListViewController(sender: UIViewController) {
        guard let router = container.resolve(DocumentListRouterType.self) as? DocumentListRouter else { return }
        router.presentDocumentListViewController(sender: sender)
    }
}
