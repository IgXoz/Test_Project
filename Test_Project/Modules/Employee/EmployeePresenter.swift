import Foundation

// Structure for loaded data. Структура для загружаемых данных.
struct EmployeeDataStore {
    let employees: [Employee]
}

class EmployeePresenter: EmployeePresenterProtocol {
    
    // MARK: Properties:
    private var dataStore: EmployeeDataStore?
    var router: EmployeeRouterProtocol! // скорее всего должен быть удален
    weak var view: EmployeeViewProtocol!
    var interactor: EmployeeInteractorProtocol!
    
    required init(view: EmployeeViewProtocol) {
        self.view = view
    }
    
    // MARK: Methods:
    func employeeDidReceive(with dataStore: EmployeeDataStore) {
        self.dataStore = dataStore
        let section = EmployeeSectionViewModel()
        dataStore.employees.forEach({ Employee in
            section.rows.append(EmployeeCellViewModel(employee: Employee))
        })
        view.reloadData(for: section)
    }
    
    func viewDidLoad() {
        interactor.fetchEmployeeInfo()
    }
 
}
