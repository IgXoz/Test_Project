//
//  EmploeeInteractor.swift
import Foundation

class EmployeeInteractor: EmployeeInteractorProtocol {
    
    // MARK: Properties:
    weak var presenter: EmployeePresenterProtocol!
    let serverService: ServerServiceProtocol = ServerService()
    
    required init(presenter: EmployeePresenterProtocol) {
        self.presenter = presenter
    }
   
    // MARK: Methods:
    func fetchEmployeeInfo() {
        serverService.loadData { employees in
            let dataStore = EmployeeDataStore(employees: employees)
            self.presenter.employeeDidReceive(with: dataStore)
        }
    }
}
