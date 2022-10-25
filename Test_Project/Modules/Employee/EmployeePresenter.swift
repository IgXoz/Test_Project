//
//  EmploeePresenter.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

class EmployeePresenter: EmployeePresenterProtocol {
    
    
    var router: EmployeeRouterProtocol! // из этого экземпляра будем вызывать все методы интерактора
    
    weak var view: EmployeeViewProtocol! // в этот экземпляр будем передавать всю инфу, которая нужна во вью
    var interactor: EmployeeInteractorProtocol! // будем работать с интерактором
    
   
    required init(view: EmployeeViewProtocol) {
        self.view = view
    }
    
    // метод инициализирует и конфигурирует первоначальные данные для вищуальных жлементов во вьюконтроллере
    func configureView() {
        print("configureView")
    }
    
    func viewDidBeginLoadingPresenter() {
        print("viewDidBeginLoadingPresenter")
        }
    
    func viewRefreshDataPresenter() {
        print("viewRefreshDataPresenter")
        
    }
    
    
    
}
