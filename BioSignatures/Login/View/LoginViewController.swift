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
import LocalAuthentication

let imageCache = NSCache<NSString, UIImage>()

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
        textfield.returnKeyType = .done
        textfield.delegate = self
        return textfield
    }()
    
    private lazy var passwordTextField: MCErrorTextField = {
        let textfield = MCErrorTextField()
        let passwordIcon = UIImageView(image: #imageLiteral(resourceName: "key"))
        textfield.leftView = passwordIcon
        textfield.leftViewMode = .always
        textfield.placeholder = "Password"
        textfield.returnKeyType = .done
        textfield.delegate = self
        textfield.isSecureTextEntry = true
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
        let signatureImgV = UIImageView()
        return signatureImgV
    }()
    
    private lazy var checkmark1: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var checkmark2: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
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
    
    private lazy var createAccountButton: RaisedButton = {
        let bttn = RaisedButton(frame: .zero)
        bttn.isEnabled = false
        bttn.backgroundColor =  UIColor(rgb: 0x0288D1)
        bttn.setTitle("Create Account", for: .normal)
        bttn.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        return bttn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        BiometricsAuthenticator.shared.authenticateWithBioMetrics(success: {
            print("Call network")
        }) { (error) in
            print(error.message)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
       
       

        if let cachedImage = imageCache.object(forKey: "signature") {
           signatureImageView.image = cachedImage
            checkmark2.isHidden = false
        }
        canCreateAccount()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
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
        view.addSubview(createAccountButton)
        view.addSubview(addSignatureButton)
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
            make.top.equalTo(divider1.snp.bottom).offset(85)
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
        
        createAccountButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-67)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(-16)
        }
    }
    
    //private methods
    
    @objc private func addIndividualSignature() {
        
        signatureImageView.isHidden = false
        
        presenter!.presentSignatureViewController()
    }
    
    @objc private func createAccount() {
        
        if imageCache.object(forKey: "signature") != nil && toggle.isOn {
            //Authenticator.shared.email = "ronaldoh1@gmail.com"
          //  print(Authenticator.shared.storedEmail)

           authenticateWithBioMetrics()
        }
        
    }
    
    @objc private func handleToggle() {
        let checkMarkIsHidden = checkmark1.isHidden
        
        if  checkMarkIsHidden  {
            checkmark1.isHidden = false
            canCreateAccount()
        } else {
            checkmark1.isHidden = true
            canCreateAccount()
        }
    }
    
    private func canCreateAccount() {
        if imageCache.object(forKey: "signature") != nil && toggle.isOn && emailTextField.text != nil, passwordTextField.text != nil {
            createAccountButton.isEnabled = true
            createAccountButton.backgroundColor =  UIColor(rgb: 0x0288D1)
        } else {
            createAccountButton.isEnabled = false
            createAccountButton.backgroundColor = UIColor.gray
        }
    }
    
    private func setupKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(LoginViewController.dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.emailTextField.inputAccessoryView = keyboardToolbar
        self.passwordTextField.inputAccessoryView = keyboardToolbar
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

extension LoginViewController: LoginViewType {
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController {
    
    func authenticateWithBioMetrics() {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Use Passcode"
        
        var authError: NSError?
        let reasonString = "To use your signature to sign important documents"
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
                
                if success {
                    
                    //TODO: User authenticated successfully, take appropriate action
                    DispatchQueue.main.async {
                        self.presenter?.signUp()

                    }
                    
                } else {
                    //TODO: User did not authenticate successfully, look at error and take appropriate action
                    guard let error = evaluateError else {
                        return
                    }
                    
                    print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error._code))
                    
                    //TODO: If you have choosen the 'Fallback authentication mechanism selected' (LAError.userFallback). Handle gracefully
                    
                }
            }
        } else {
            
            guard let error = authError else {
                return
            }
            //TODO: Show appropriate alert if biometry/TouchID/FaceID is lockout or not enrolled
            print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error.code))
        }
    }
    
    func evaluatePolicyFailErrorMessageForLA(errorCode: Int) -> String {
        var message = ""
        if #available(iOS 11.0, macOS 10.13, *) {
            switch errorCode {
            case LAError.biometryNotAvailable.rawValue:
                message = "Authentication could not start because the device does not support biometric authentication."
                
            case LAError.biometryLockout.rawValue:
                message = "Authentication could not continue because the user has been locked out of biometric authentication, due to failing authentication too many times."
                
            case LAError.biometryNotEnrolled.rawValue:
                message = "Authentication could not start because the user has not enrolled in biometric authentication."
                
            default:
                message = "Did not find error code on LAError object"
            }
        } else {
            switch errorCode {
            case LAError.touchIDLockout.rawValue:
                message = "Too many failed attempts."
                
            case LAError.touchIDNotAvailable.rawValue:
                message = "TouchID is not available on the device"
                
            case LAError.touchIDNotEnrolled.rawValue:
                message = "TouchID is not enrolled on the device"
                
            default:
                message = "Did not find error code on LAError object"
            }
        }
        
        return message;
    }
    
    func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String {
        
        var message = ""
        
        switch errorCode {
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.notInteractive.rawValue:
            message = "Not interactive"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = evaluatePolicyFailErrorMessageForLA(errorCode: errorCode)
        }
        
        return message
    }
    
}
