//
//  SignatureRouter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject
import UIKit

class  SignatureRouter {
    
    private let container: Container
    
    required init(container: Container) {
        self.container = container
    }
    
}

extension  SignatureRouter:  SignatureRouterType {
    
    func presentSignatureViewController(sender: UIViewController) {
        guard let controller = container.resolve(SignatureViewType.self) as? SignatureViewController else { return }
        controller.navigationController?.isNavigationBarHidden = false
        sender.navigationController?.pushViewController(controller, animated: true)
    }
    
}
