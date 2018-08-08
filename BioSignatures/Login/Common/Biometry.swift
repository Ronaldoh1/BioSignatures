//
//  Biometry.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/28/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import Foundation

enum Biometrics: String {
    
    case notAvailableReason = "Biometric authentication is not available for this device."
    
    case touchIDAuthenticationReason = "Confirm your fingerprint to authenticate."
    case touchIDPasscodeAuthenticationReason = "Touch ID is locked now, because of too many failed attempts. Enter passcode to unlock Touch ID."
    
    case setPassCodeToUseTouchID = "Please set device passcode to use Touch ID for authentication."
    case noFingerPrintsEnrolled = "There are no fingerprints enrolled in the device. Please go to Device Settings -> Touch ID & Passcode and enroll your fingerprints."
    case defaultTouchIDAuthenticationFailedReason = "Touch ID does not recognize your fingerprint. Please try again with your enrolled fingerprint."
    
    case faceIDAuthenticationReason = "Confirm your face to authenticate." // revisit
    case faceIDPasscodeAuthenticationReason = "Face ID is locked now, because of too many failed attempts. Enter passcode to unlock Face ID."
    
    case setPassCodeToUseFaceID = "Please set device passcode to use Face ID for authentication."
    case noFaceIdentityEnrolled = "There is no face enrolled in the device. Please go to Device Settings -> Face ID & Passcode and enroll your face."
    case defaultFaceIDAuthenticationFailedReason = "Face ID does not recognize your face. Please try again with your enrolled face."
    
}
