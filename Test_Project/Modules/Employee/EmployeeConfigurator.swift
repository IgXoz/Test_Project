//
//  EmploeeConfigurator.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

class EmployeeConfigurator: EmployeeConfiguratorProtocol {
    
    //Этот метод необходим для конфишурации модуля. EmployeeViewController имеет свойство configure, кот. будет конфигурироваться во viewDidLoad. Все компоненты общаются между собой с помощью протоколов. 
    func configure(with viewController: EmployeeViewController) {
        let presenter = EmployeePresenter(view: viewController)
        let interactor = EmployeeInteractor(presenter: presenter)
        let router = EmployeeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.currencyPickerView = viewController.currencyPickerView
        viewController.currencyPickerView.delegate = presenter
    }
}
