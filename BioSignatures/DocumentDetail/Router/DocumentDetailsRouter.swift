//
//  DocumentDetailsRouter.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Swinject
import UIKit

class  DocumentDetailsRouter {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
}


extension  DocumentDetailsRouter:  DocumentDetailsRouterType {
    
    func presentDocumentDetailsViewController(sender: UIViewController, document: Document) {
        guard let controller = container.resolve(DocumentDetailsViewType.self) as? DocumentDetailsViewController else { return }
        controller.navigationItem.leftBarButtonItem = nil
        sender.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
