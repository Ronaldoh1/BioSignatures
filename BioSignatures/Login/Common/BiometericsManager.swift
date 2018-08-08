//
//  BiometericsManager.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/28/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit
import LocalAuthentication

class BiometricsAuthenticator {
    
    static let shared = BiometricsAuthenticator()
    
    private init() { }
    
    func canAuthenticateWithBioMetrics() -> Bool {
        var isBiometricAuthenticationAvailable = false
        var error: NSError? = nil
        
        if LAContext().canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            isBiometricAuthenticationAvailable = (error == nil)
        }
        return isBiometricAuthenticationAvailable
    }
    
    func authenticateWithBioMetrics(success: @escaping (()-> Void), failure: @escaping ((AuthenticationError) -> Void)) {
        let reasonString = defaultBiometricAuthenticationReason()
        let context = LAContext()
        context.localizedFallbackTitle = ""
        
        evaluate(policy: LAPolicy.deviceOwnerAuthenticationWithBiometrics, with: context, reason: reasonString, success: success, failure: failure)
    }
    
    // MARK:- Private Methods
    
    private func authenticateWithPasscode(success: @escaping (()-> Void), failure: @escaping ((AuthenticationError) -> Void)) {
        let reasonString = defaultPassCodeAuthenticationReason()
        let context = LAContext()
        
        if #available(iOS 9.0, *) {
            evaluate(policy: LAPolicy.deviceOwnerAuthentication, with: context, reason: reasonString, success: success, failure: failure)
        } else {
            evaluate(policy: LAPolicy.deviceOwnerAuthenticationWithBiometrics, with: context, reason: reasonString, success: success, failure: failure)
        }
    }
    
    func isFaceIDAvailable() -> Bool {
        if #available(iOS 11.0, *) {
            let context = LAContext()
            return context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: nil) && context.biometryType == .faceID
        }
        return false
    }
    
    func isTouchIDAvailable() -> Bool {
        if #available(iOS 8.0, *) {
            let context = LAContext()
            return context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: nil) && context.biometryType == .touchID
        }
        return false
    }
    
    private func defaultBiometricAuthenticationReason() -> String {
        return isFaceIDAvailable() ? Biometrics.faceIDAuthenticationReason.rawValue : Biometrics.touchIDAuthenticationReason.rawValue
    }
    
    private func defaultPassCodeAuthenticationReason() -> String {
        return isFaceIDAvailable() ? Biometrics.touchIDPasscodeAuthenticationReason.rawValue : Biometrics.touchIDPasscodeAuthenticationReason.rawValue
    }
    
    
    private func evaluate(policy: LAPolicy, with context: LAContext, reason: String, success: @escaping (() -> (Void)), failure: @escaping ((AuthenticationError) -> Void)) {
        context.evaluatePolicy(policy, localizedReason: reason) { (policySuccess, error) in
            DispatchQueue.main.async {
                if policySuccess {
                    success()
                } else {
                    let error = AuthenticationError.initWithError(error as! LAError)
                    failure(error)
                }
            }
        }
    }
}
