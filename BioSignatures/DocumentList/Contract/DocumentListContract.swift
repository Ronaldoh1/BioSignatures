//
//  DocumentListContract.swift
//  BioDocumentLists
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit

protocol DocumentListViewType: class {
    
    var presenter: DocumentListPresenterType? { get set }
    
}

protocol DocumentListInteractorType: class {
    
    
}

protocol DocumentListPresenterType: class {
    
    func viewDidAppear()
    func signUp(email: String, password: String)
    
    
}

protocol DocumentListRouterType: class {
    
    func presentDocumentListViewController(sender: UIViewController)
    
}
