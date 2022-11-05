//
//  EmploeeProtocols.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

protocol EmployeeViewProtocol: AnyObject {
//    var viewEmployee: [Employee] { get set }
    
    func reloadData(for section: EmployeeSectionViewModel)
    // необходимо наполнить протокол
    
}

protocol EmployeePresenterProtocol: AnyObject {
    
    //должен иметь router и методы, которые вызываются при нажатии на ячейку/кнопку
    var router: EmployeeRouterProtocol! { set get } // 
    func configureViewPresenter(completion: @escaping (_ interactorEmployee: [Employee])->()) // метод инициализирует и конфигурирует первоначальные
    //данные для визуальных элементов во вьюконтроллере.
    
    func employeeDidReceive(with dataStore: EmployeeDataStore)
    func viewDidLoad()
    
}

protocol EmployeeInteractorProtocol: AnyObject {
    
    var interactorEmployee: [Employee] { get set }
    var employees: Welcome? { get set }
    
    func loadDataInteractor(completion: @escaping (_ employee: [Employee])->())
    
    func saveDataInteractor()
    
    func removeDataInteractor()
    func fetchEmployeeInfo()
      
}

protocol EmployeeConfiguratorProtocol: AnyObject {
    
    func configure(with viewController: EmployeeViewController)
    
    //внутри этого метода конфигурируется модуль
    
}

protocol EmployeeRouterProtocol: AnyObject {
// this protocol is not required for one screen app.

}
