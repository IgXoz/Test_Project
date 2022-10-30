//
//  EmploeeConfigurator.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

class EmployeeConfigurator: EmployeeConfiguratorProtocol {
    
    //Этот метод необходим для конфигурации модуля. EmployeeViewController имеет свойство configure, кот. будет конфигурироваться во viewDidLoad. Все компоненты общаются между собой с помощью протоколов. 
    func configure(with viewController: EmployeeViewController) {
        let presenter = EmployeePresenter(view: viewController)
        let interactor = EmployeeInteractor(presenter: presenter)
        let router = EmployeeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
    //чтобы не получить утечку памяти презентер у вьюконтроллера указывается как strong, а вьюконтроллер у презентера как weak, интерактор у презентера указывается как weak и тд
    // при закрытии viewController все жлементы уничтожаются, тк никто не может иметь сильную ссылку на вьюконтроллер
    
}
