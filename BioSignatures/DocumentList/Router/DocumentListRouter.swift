//
//  DocumentListRouter.swift
//  BioDocumentLists
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject
import UIKit

class DocumentListRouter {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
}


extension DocumentListRouter: DocumentListRouterType {
    
    func presentDocumentListViewController(sender: UIViewController) {
        
    }
    
    
}
