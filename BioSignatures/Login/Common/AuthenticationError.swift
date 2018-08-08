//
//  AuthenticationError.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/28/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import LocalAuthentication

enum AuthenticationError {
    
    case authenticationFailed
    case canceledByUser
    case fallback
    case canceledBySystem
    case passcodeNotSet
    case canceledByApp
    case biometryNotAvailable
    case biometryNotEnrolled
    case biometryLockedout
    case other
    
    static func initWithError(_ error: LAError) -> AuthenticationError {
        switch Int32(error.errorCode) {
            
        case kLAErrorAuthenticationFailed: return authenticationFailed
        case kLAErrorUserCancel: return canceledByUser
        case kLAErrorUserFallback: return fallback
        case kLAErrorSystemCancel: return canceledBySystem
        case kLAErrorPasscodeNotSet: return passcodeNotSet
        case kLAErrorAppCancel: return canceledByApp
        case kLAErrorBiometryNotAvailable: return biometryNotAvailable
        case kLAErrorBiometryNotEnrolled: return biometryNotEnrolled
        case kLAErrorBiometryLockout: return biometryLockedout
        default: return other
        }
    }
    
    var message: String {
        switch self {
        case .canceledByUser, .fallback, .canceledBySystem: return ""
        case .passcodeNotSet: return isFaceIDAvailable() ? Biometrics.setPassCodeToUseFaceID.rawValue : Biometrics.setPassCodeToUseTouchID.rawValue
        case .canceledByApp: return ""
        case .biometryNotAvailable: return Biometrics.notAvailableReason.rawValue
        case .biometryNotEnrolled: return isFaceIDAvailable() ? Biometrics.noFaceIdentityEnrolled.rawValue : Biometrics.noFingerPrintsEnrolled.rawValue
        case .biometryLockedout: return isFaceIDAvailable() ? Biometrics.faceIDPasscodeAuthenticationReason.rawValue : Biometrics.touchIDPasscodeAuthenticationReason.rawValue
        default: return isFaceIDAvailable() ? Biometrics.noFaceIdentityEnrolled.rawValue : Biometrics.noFingerPrintsEnrolled.rawValue
        }
    }
    
    
    private func isFaceIDAvailable() -> Bool {
        if #available(iOS 11.0, *) {
            let context = LAContext()
            return context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: nil) && context.biometryType == .faceID
        }
        return false
    }
}
