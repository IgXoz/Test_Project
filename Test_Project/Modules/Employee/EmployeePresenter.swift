//
//  EmploeePresenter.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

class EmployeePresenter: EmployeePresenterProtocol {
    func cellClicked() {
        print("cellClicked")
    }
    var presenterEmployee: [Employee] = []
    var router: EmployeeRouterProtocol! // скорее всего должен быть удален
    
    weak var view: EmployeeViewProtocol! // в этот экземпляр будем передавать всю инфу, которая нужна во вью
    var interactor: EmployeeInteractorProtocol! // будем работать с интерактором
    
   
    required init(view: EmployeeViewProtocol) {
        self.view = view
    }
    
    // метод инициализирует и конфигурирует первоначальные данные для визуальных элементов во вьюконтроллере
//    func configureViewPresenter()  -> ([Employee]) {
//
////        sendModel(interactor.interactorEmployee)
////        interactor.saveDataInteractor()
////        let a = {interactor.saveDataInteractor}()
////        print("configureViewPresenter is \")
////        return interactor.loadDataInteractor()
//
//        interactor.loadDataInteractor { interactorEmployee in
//            self.presenterEmployee = interactorEmployee
//            print("Employee in loadDataPresenter is \(self.presenterEmployee)")
//            print("EmployeeClosure in loadDataPresenter is \(interactorEmployee)")
//        }
////        print("sendModelInteractor")
//
//    }
    func configureViewPresenter(completion: @escaping ([Employee]) -> ()) {
        interactor.loadDataInteractor { interactorEmployee in
            self.presenterEmployee = interactorEmployee
            print("Employee in loadDataPresenter is \(self.presenterEmployee)")
            print("EmployeeClosure in loadDataPresenter is \(interactorEmployee)")
            completion(self.presenterEmployee)
        }
    }
    
    func sendModel(_ presenterEmployee: [Employee]) {
        view.viewEmployee = presenterEmployee
    }
    
    func viewDidBeginLoadingPresenter() {
        print("viewDidBeginLoadingPresenter")
        }
    
    func viewRefreshDataPresenter() {
        print("viewRefreshDataPresenter")
        
    }
 
}
