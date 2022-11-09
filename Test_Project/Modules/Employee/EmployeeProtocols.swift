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
    func fetchNetworkData()
    func fetchCachedData()
    func testDecodeMethod() // test
    
}

protocol EmployeeConfiguratorProtocol: AnyObject {
    
    func configure(with viewController: EmployeeViewController)
    
}

protocol EmployeeRouterProtocol: AnyObject {
// this protocol is not required for one screen app.

}
