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
    
    var presenter: SignaturePresenterType?
    
    private let signatureView: YPDrawSignatureView = {
        let signatureView = YPDrawSignatureView(frame: .zero)
        signatureView.backgroundColor = .white
        return signatureView
    }()
    
    private let bigXImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bigX"))
        return imageView
    }()
    
    private let signatureLine: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let disclosureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = "Sign your name using your finger"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        //setNavigationBar()
    }

    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupCompactConstraints()
        default: break
        }
    }
    
    private func setupViews() {
        view.addSubview(signatureView)
        view.addSubview(signatureLine)
        view.addSubview(bigXImageView)
        view.addSubview(disclosureLabel)
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.height, height: 44))
        let navItem = UINavigationItem(title: "Add New Signature")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: nil, action: #selector(cancel))
        navItem.rightBarButtonItem = doneItem
        navItem.leftBarButtonItem = cancelItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc private func done() { // remove @objc for Swift 3
        
    }
    
    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupCompactConstraints() {
        signatureView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        bigXImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        signatureLine.snp.makeConstraints { (make) in
            make.left.equalTo(bigXImageView.snp.left).offset(-10)
            make.right.equalToSuperview().offset(25)
            make.bottom.equalTo(bigXImageView.snp.bottom).offset(10)
            make.height.equalTo(2)
        }
        
        disclosureLabel.snp.makeConstraints { (make) in
            make.left.equalTo(signatureLine.snp.left)
            make.right.equalTo(signatureLine.snp.right)
            make.top.equalTo(signatureLine.snp.top).offset(5)
        }
    }


}

extension SignatureViewController: SignatureViewType {
    
    
}
