import Foundation

protocol EmployeeViewProtocol: AnyObject {
    func reloadData(for section: EmployeeSectionViewModel)
}

protocol EmployeePresenterProtocol: AnyObject {
    var router: EmployeeRouterProtocol! { set get } // not required
    func employeeDidReceive(with dataStore: EmployeeDataStore)
    func viewDidLoad()
    
}

protocol EmployeeInteractorProtocol: AnyObject {
    func fetchEmployeeInfo()
}

protocol EmployeeConfiguratorProtocol: AnyObject {
    
    func configure(with viewController: EmployeeViewController)
    
    //внутри этого метода конфигурируется модуль
    
}

protocol EmployeeRouterProtocol: AnyObject {
// this protocol is not required for one screen app.

}
