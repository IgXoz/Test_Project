import Foundation

protocol EmployeeDisplayLogicProtocol: AnyObject {
    func reloadData(for section: EmployeeSectionViewModel)
}

protocol EmployeePresentationLogicProtocol: AnyObject {
    var router: EmployeeRouterProtocol! { set get } // not required
    func employeeDidReceive(with dataStore: EmployeeDataStore)
    func displayData()
}

protocol EmployeeBusinessLogicProtocol: AnyObject {
    func loadData()
}

protocol EmployeeConfiguratorProtocol: AnyObject {
    func configure(with viewController: EmployeeViewController)
}

protocol EmployeeRouterProtocol: AnyObject {
// this protocol is not required for one screen app and may be removed.
}
