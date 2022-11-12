import Foundation

// Structure for loaded data. Структура для загружаемых данных.
struct EmployeeDataStore {
    let employees: [Employee]
}

class EmployeePresenter: EmployeePresentationLogicProtocol {
    
    // MARK: Properties:
    private var dataStore: EmployeeDataStore?
    var router: EmployeeRouterProtocol! // not required for one-screen app, can be removed.
    weak var view: EmployeeDisplayLogicProtocol!
    var interactor: EmployeeBusinessLogicProtocol!
    
    required init(view: EmployeeDisplayLogicProtocol) {
        self.view = view
    }
    
    // MARK: Methods:
    func employeeDidReceive(with dataStore: EmployeeDataStore) { 
        self.dataStore = dataStore
        let section = EmployeeSectionViewModel()
        
        let sortedEmployees = dataStore.employees.sorted(by: {$0.name < $1.name})
        sortedEmployees.forEach { employee in
            let cellViewModel = EmployeeCellViewModel(employee: employee)
            section.rows.append(cellViewModel)
        }
        view.reloadData(for: section)
    }
    
    func displayData() {
        interactor.loadData()
    }
    
    
    func showAlert() {
        DispatchQueue.main.async {
            self.view.presentAlert()
        }
        
    }
 
}
