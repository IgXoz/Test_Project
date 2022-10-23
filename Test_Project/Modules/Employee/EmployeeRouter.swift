//
//  EmploeeRouter.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation
import UIKit

class EmployeeRouter: EmployeeRouterProtocol {
    
    weak var viewController: EmployeeViewController!
    
    init(viewController: EmployeeViewController) {
        self.viewController = viewController
    }
    
    func showAboutScene() {
//        viewController.performSegue(withIdentifier: viewController.selfToAboutSegueName, sender: nil)
    }

//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare here some data for destination viewController
    }
}
