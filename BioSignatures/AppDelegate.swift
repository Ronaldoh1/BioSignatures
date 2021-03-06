//
//  AppDelegate.swift
//  BioSignatures
//
//  Created by Hernandez, Ronald on 7/23/18.
//  Copyright © 2018 Team Bio. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
    
    private let assemblies: [Assembly] = [LoginAssembly(), SignatureAssembly(), DocumentListAssembly(), DocumentDetailsAssembly()]

}


extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupInitialization()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            if navigationController.visibleViewController is SignatureViewController {
                return UIInterfaceOrientationMask.allButUpsideDown
            } else {
                return UIInterfaceOrientationMask.portrait
            }
        }
        return UIInterfaceOrientationMask.portrait
    }
    
    //MARK: - Private methods
    
    func setupInitialization() {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return }
        let assembler = Assembler(assemblies)
        guard let router = assembler.resolver.resolve(LoginRouterType.self) as? LoginRouter else { return }
        router.presentLoginViewController(in: window)
    }

}

