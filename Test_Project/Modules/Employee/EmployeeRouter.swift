import Foundation

// this class is not required for one screen app
class EmployeeRouter: EmployeeRouterProtocol {
    
    weak var viewController: EmployeeViewController!
    
    init(viewController: EmployeeViewController) {
        self.viewController = viewController
    }
}
    
    
 
