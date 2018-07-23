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
    
    private lazy var emailTextField: MCErrorTextField = {
        let textfield = MCErrorTextField()
        let emailIcon = UIImageView(image: #imageLiteral(resourceName: "envelope"))
        textfield.leftView = emailIcon
        textfield.leftViewMode = .always
        textfield.placeholder = "Email"
        return textfield
    }()
    
    private lazy var passwordTextField: MCErrorTextField = {
        let textfield = MCErrorTextField()
        let passwordIcon = UIImageView(image: #imageLiteral(resourceName: "key"))
        textfield.leftView = passwordIcon
        textfield.leftViewMode = .always
        textfield.placeholder = "Password"
        return textfield
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    } ()
    
    private lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        return toggle
    }()
    
    private lazy var toggleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Face ID"
        return label
    }()
    
    private lazy var addFaceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [toggle, toggleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    } ()
    
    private lazy var signatureImageView: UIImageView = {
        let signatureImgV = UIImageView()
        signatureImgV.isHidden = true
        return signatureImgV
    }()
    
    private lazy var addSignatureButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(addIndividualSignature), for: .touchUpInside)
        button.tintColor = UIColor.white
        button.titleLabel?.text = "Add Signature"
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addSignatureButton])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    } ()
    
    private lazy var mainStackview: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textFieldStackView, addFaceStackView, buttonStackView])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    } ()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.titleLabel?.text = "Create Account"
        return button
    }()
    
    private lazy var createAccountStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [createAccountButton])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.white
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
        
        mainStackview.snp.makeConstraints {
            $0.left.equalTo(view.snp.leftMargin)
            $0.right.equalTo(view.snp.rightMargin)
            $0.top.equalTo(view.snp.topMargin)
        }
        
        createAccountButton.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.bottom.equalTo(view.snp.bottomMargin)
            }
        }
}

extension LoginViewController: LoginViewType {
    
}

