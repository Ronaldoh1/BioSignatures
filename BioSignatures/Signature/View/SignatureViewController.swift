//
//  SignatureViewController.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit
import SnapKit

class SignatureViewController: UIViewController {
    
    private let signatureView: YPDrawSignatureView = {
        let signatureView = YPDrawSignatureView(frame: .zero)
        signatureView.backgroundColor = .white
        return signatureView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .compact: setupCompactConstraints()
        default: break
        }
    }
    
    private func setupViews() {
        view.addSubview(signatureView)
    }
    
    
    private func setupCompactConstraints() {
        signatureView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }


}
