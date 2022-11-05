//
//  EmploeeInteractor.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

class EmployeeInteractor: EmployeeInteractorProtocol {
   
    func loadDataInteractor(completion: @escaping ([Employee]) -> ()) {
        print("loadDataInteractor")
        serverService.loadData { employee in
            self.interactorEmployee = employee
            print("Employee in loadDataInteractor is \(self.interactorEmployee)")
            print("EmployeeClosure in loadDataInteractor is \(employee)")
        }
        print("sendModelInteractor")
        completion(self.interactorEmployee)
    }
    
    func fetchEmployeeInfo() {
        serverService.loadData { employees in
            let dataStore = EmployeeDataStore(employees: employees)
            self.presenter.employeeDidReceive(with: dataStore)
        }
        
        
    }
    
    var employees: Welcome? // s/b deleted
    var interactorEmployee: [Employee] = [] // s/b deleted
    
    weak var presenter: EmployeePresenterProtocol!
    
    let serverService: ServerServiceProtocol = ServerService() 
    
    
    required init(presenter: EmployeePresenterProtocol) {
        self.presenter = presenter
    }
    
        
//    func loadDataInteractor() -> ([Employee]) {
//        print("loadDataInteractor")
//        serverService.loadData { employee in
//            self.interactorEmployee = employee
//            print("Employee in loadDataInteractor is \(self.employee)")
//            print("EmployeeClosure in loadDataInteractor is \(employee)")
//        }
//        print("sendModelInteractor")
//        return interactorEmployee
//    }
    
    func saveDataInteractor() {
        print("saveDataInteractor")
    }
    
    func removeDataInteractor() {
        print("removeDataInteractor ")
    }
   
    
}
