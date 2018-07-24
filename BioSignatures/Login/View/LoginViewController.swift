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
    
    
    private let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.backgroundColor = UIColor.init(rgb: 0xCCCCCC)
        toggle.layer.cornerRadius = 16.0
        toggle.onTintColor = UIColor(rgb: 0x0288D1)
        toggle.addTarget(self, action: #selector(handleToggle), for: .valueChanged)
        return toggle
    }()
    
    private lazy var toggleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Face ID"
        label.textColor = .gray
        return label
    }()
    
    
    private lazy var signatureImageView: UIImageView = {
        let signatureImgV = UIImageView(image: #imageLiteral(resourceName: "Signature-logo"))
        return signatureImgV
    }()
    
    private lazy var checkmark1: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var checkmark2: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
        return imageView
    }()
    
    private lazy var addSignatureButton: RaisedButton = {
        let button = RaisedButton(frame: .zero)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(addIndividualSignature), for: .touchUpInside)
        button.setTitle("Add Signature", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let divider1: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let divider2: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var createAccountButton: RaisedButton = {
        let bttn = RaisedButton(frame: .zero)
        bttn.backgroundColor =  UIColor(rgb: 0x0288D1)
        bttn.setTitle("Create Account", for: .normal)
        bttn.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        return bttn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.init(rgb: 0xDBE1EA)
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(toggle)
        view.addSubview(toggleLabel)
        view.addSubview(signatureImageView)
        view.addSubview(divider1)
        view.addSubview(checkmark1)
        view.addSubview(checkmark2)
        view.addSubview(divider2)
        view.addSubview(createAccountButton)
        view.addSubview(addSignatureButton)
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

        emailTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(100)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
        }
        
        toggle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
        }
        
        toggleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(toggle.snp.right).offset(15)
            make.centerY.equalTo(toggle.snp.centerY)
            make.right.equalToSuperview()
        }
        
        checkmark1.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(toggle.snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        checkmark2.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(signatureImageView.snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        addSignatureButton.snp.makeConstraints { (make) in
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
            make.height.equalTo(44)
            make.top.equalTo(divider2.snp.bottom).offset(10)
        }
        signatureImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(checkmark1.snp.bottom).offset(20)
            make.height.equalTo(75)
            make.width.equalTo(150)
        }
        
        divider1.snp.makeConstraints { (make) in
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
            make.top.equalTo(toggleLabel.snp.bottom).offset(15)
            make.height.equalTo(0.5)
        }
        
        divider2.snp.makeConstraints { (make) in
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
            make.top.equalTo(signatureImageView.snp.bottom).offset(10)
            make.height.equalTo(0.5)
        }
        
        createAccountButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(-16)
        }
    }
    
    //private methods
    
    @objc private func addIndividualSignature() {
        
        signatureImageView.isHidden = false
        
        print("adding individual signature")
    }
    
    @objc private func createAccount() {
        print("Creating an account")
    }
    
    @objc private func handleToggle() {
        let checkMarkIsHidden = checkmark1.isHidden
        
        if  checkMarkIsHidden  {
            checkmark1.isHidden = false
        } else {
            checkmark1.isHidden = true
        }
    }

}

extension LoginViewController: LoginViewType {
    
}

