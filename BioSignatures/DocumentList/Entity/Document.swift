//
//  Document.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/24/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit


class Document {
    
    let title: String
    let assignedTo: String
    var signature: UIImageView?
    var isSigned = false
    var date: Date?
    
    init(title: String, assignedTo: String) {
        self.title = title
        self.assignedTo = assignedTo
    }
    
}
