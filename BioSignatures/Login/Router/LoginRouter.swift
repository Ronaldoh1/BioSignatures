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
        let rootViewController = UINavigationController(rootViewController: SignatureViewController())
        rootViewController.navigationBar.isHidden = true

        windwow.makeKeyAndVisible()
        windwow.rootViewController = rootViewController
    }
    
}
