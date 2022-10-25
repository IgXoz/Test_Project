//
//  EmploeeProtocols.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

protocol EmployeeViewProtocol: class {
    
    // необходимо наполнить протокол
    
}

protocol EmployeePresenterProtocol: class{
    
    //должен иметь router и методы, которые вызываются при нажатии на ячейку/кнопку
    
    var router: EmployeeRouterProtocol! { set get } // 
    func configureView() // метод инициализирует и конфигурирует первоначальные
    //данные для визуальных элементов во вьюконтроллере.
    
    func cellClicked() // вызывается при тапе на ячейку. мб этот метода и не нужен
    
}

protocol EmployeeInteractorProtocol: class {
    
    func loadDataInteractor()
    
    func saveDataInteractor()
    
    func removeDataInteractor()
      
}

protocol EmployeeConfiguratorProtocol: class {
    
    func configure(with viewController: EmployeeViewController)
    
    //внутри этого метода конфигурируется модуль
    
}

protocol EmployeeRouterProtocol: class {
// this protocol is not required for one screen app.

}
