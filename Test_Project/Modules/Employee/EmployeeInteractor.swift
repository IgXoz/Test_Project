//
//  EmploeeInteractor.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

class EmployeeInteractor: EmployeeInteractorProtocol {
    
    
    weak var presenter: EmployeePresenterProtocol!
    
//    let serverService: ServerServiceProtocol = ServerService()
    
    
    required init(presenter: EmployeePresenterProtocol) {
        self.presenter = presenter
    }
    
        
    func loadDataInteractor() {
        print("loadDataInteractor")
    }
    
    func saveDataInteractor() {
        print("saveDataInteractor")
    }
    
    func removeDataInteractor() {
        print("removeDataInteractor ")
    }
   
    
}
