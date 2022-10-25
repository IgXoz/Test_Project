//
//  EmploeeInteractor.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

class EmployeeInteractor: EmployeeInteractorProtocol {
    
    var employees: Welcome?
    var employee: [Employee] = []
    
    weak var presenter: EmployeePresenterProtocol!
    
//    let serverService: ServerServiceProtocol = ServerService()
    
    
    required init(presenter: EmployeePresenterProtocol) {
        self.presenter = presenter
    }
    
        
    func loadDataInteractor() {
        print("loadDataInteractor")
        ServerService.loadData { employee in
            self.employee = employee
        }
        print("sendModelInteractor")
    }
    
    func saveDataInteractor() {
        print("saveDataInteractor")
    }
    
    func removeDataInteractor() {
        print("removeDataInteractor ")
    }
   
    
}
