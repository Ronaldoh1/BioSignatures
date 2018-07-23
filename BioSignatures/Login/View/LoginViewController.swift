//
//  ViewController.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit
import Material
import SnapKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterType?
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    private lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        let emailIcon = UIImageView(image: #imageLiteral(resourceName: "envelope"))
        textfield.leftView = emailIcon
        textfield.leftViewMode = .always
        textfield.dividerContentEdgeInsets.left = .leastNonzeroMagnitude
        textfield.dividerThickness = 1.0
        textfield.placeholder = "Email"
        return textfield
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        let passwordIcon = UIImageView(image: #imageLiteral(resourceName: "key"))
        textfield.leftView = passwordIcon
        textfield.leftViewMode = .always
        textfield.dividerContentEdgeInsets.left = .leastNonzeroMagnitude
        textfield.dividerThickness = 1.0
        textfield.placeholder = "Password"
        return textfield
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    } ()
    
    private lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        return toggle
    }()
    
    private lazy var toggleLabel: UILabel = {
        var label = UILabel()
        label.text = "Add Face ID"
        return label
    }()
    
    private lazy var addFaceStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [toggle, toggleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    } ()
    
    private lazy var signatureImageView: UIImageView = {
        var signatureImgV = UIImageView()
        signatureImgV.isHidden = true
        return signatureImgV
    }()
    
    private lazy var addSignatureButton: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(addIndividualSignature), for: .touchUpInside)
        button.titleLabel?.text = "Add Signature"
        return button
    }()
    
    private lazy var mainStackview: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [textFieldStackView, addFaceStackView, addSignatureButton ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    } ()
    
    private lazy var createAccountButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.text = "Create Account"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(mainStackview)
        view.addSubview(createAccountButton)
    }
    
    //private methods
    
    @objc func addIndividualSignature() {
        
        signatureImageView.isHidden = false
    }

 
    //MARK: Set up views
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        default: break
        }
        
    }
    
    
    private func setupRegularConstraints() {
        
        addFaceStackView.snp.remakeConstraints {
            $0.left.equalTo(mainStackview.snp.left)
        }

        mainStackview.snp.remakeConstraints {
            $0.left.equalTo(view.snp.leftMargin)
            $0.right.equalTo(view.snp.rightMargin)
            $0.centerY.equalTo(view.snp.topMargin)
        }
        
        createAccountButton.snp.remakeConstraints {
                $0.centerX.equalToSuperview()
                $0.bottom.equalTo(view.snp.bottomMargin)
            }
        }

}

extension LoginViewController: LoginViewType {
    
}

