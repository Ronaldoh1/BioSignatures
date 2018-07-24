//
//  DocumentDetailsContract.swift
//  BioDocumentDetailss
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit

protocol DocumentDetailsViewType: class {
    
    var presenter: DocumentDetailsPresenterType? { get set }
    
}

protocol DocumentDetailsInteractorType: class {
    
    
}

protocol DocumentDetailsPresenterType: class {
    
    func viewDidAppear()
    func signUp(email: String, password: String)
    
    
}

protocol DocumentDetailsRouterType: class {
    
    func presentDocumentDetailsViewController(sender: UIViewController, document: Document)
    
}
