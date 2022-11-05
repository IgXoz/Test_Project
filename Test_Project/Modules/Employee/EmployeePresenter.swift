//
//  EmploeePresenter.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

struct EmployeeDataStore {
    let employees: [Employee]
}

class EmployeePresenter: EmployeePresenterProtocol {
   
    func configureViewPresenter(completion: @escaping ([Employee]) -> ()) {
        interactor.loadDataInteractor { interactorEmployee in
            self.presenterEmployee = interactorEmployee
            print("Employee in loadDataPresenter is \(self.presenterEmployee)")
            print("EmployeeClosure in loadDataPresenter is \(interactorEmployee)")
            completion(self.presenterEmployee)
        }
    }
    
    private var dataStore: EmployeeDataStore?
    var presenterEmployee: [Employee] = []
    var router: EmployeeRouterProtocol! // скорее всего должен быть удален
    
    weak var view: EmployeeViewProtocol! // в этот экземпляр будем передавать всю инфу, которая нужна во вью
    var interactor: EmployeeInteractorProtocol! // будем работать с интерактором
    
   
    required init(view: EmployeeViewProtocol) {
        self.view = view
    }
    func employeeDidReceive(with dataStore: EmployeeDataStore) {
        self.dataStore = dataStore
        let section = EmployeeSectionViewModel()
        dataStore.employees.forEach({ Employee in
            section.rows.append(EmployeeCellViewModel(employee: Employee))
        })
        view.reloadData(for: section)
    }
    
    // метод инициализирует и конфигурирует первоначальные данные для визуальных элементов во вьюконтроллере
    
    func sendModel(_ presenterEmployee: [Employee]) {
//        view.viewEmployee = presenterEmployee
    }
    
    func viewDidBeginLoadingPresenter() {
        print("viewDidBeginLoadingPresenter")
        }
    
    func viewRefreshDataPresenter() {
        print("viewRefreshDataPresenter")
        
    }
    
    func viewDidLoad() {
        interactor.fetchEmployeeInfo()
    }
 
}
