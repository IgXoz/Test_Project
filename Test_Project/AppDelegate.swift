//
//  AppDelegate.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .gray
    window?.rootViewController = EmployeeViewController()
    window?.makeKeyAndVisible()
    return true
    }
    }
