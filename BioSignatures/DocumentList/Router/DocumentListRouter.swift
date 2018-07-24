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
    
    func presentDocumentDetailsViewController(sender: UIViewController, document: Document) {
        guard let router = container.resolve(DocumentDetailsRouterType.self) else { return }
        router.presentDocumentDetailsViewController(sender: sender, document: Document)
    }
    
    
    func presentDocumentListViewController(sender: UIViewController) {
        guard let controller = container.resolve(DocumentListViewType.self) as? DocumentListViewController else { return }
        controller.navigationController?.isNavigationBarHidden = false
        sender.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
