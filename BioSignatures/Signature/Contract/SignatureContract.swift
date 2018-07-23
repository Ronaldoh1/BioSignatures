//
//  SignatureContract.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit

protocol SignatureViewType: class {
    
    var presenter: SignaturePresenterType? { get set }
    
}

protocol SignatureInteractorType: class {
    
    
}

protocol SignaturePresenterType: class {
    
    func viewDidAppear()
    func signUp(email: String, password: String)
    
    
}

protocol SignatureRouterType: class {
    
    func presentSignatureViewController(sender: UIViewController)
    
}
