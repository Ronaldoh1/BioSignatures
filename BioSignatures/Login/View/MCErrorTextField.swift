//
//  MCTextField.swift
//  BioSignatures
//
//  Created by Ahmad, Sara on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//
import Material

class MCErrorTextField: ErrorTextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.dividerContentEdgeInsets.left = .leastNonzeroMagnitude
        self.dividerThickness = 1.0
        self.dividerColor = .darkGray
    }
    
}
