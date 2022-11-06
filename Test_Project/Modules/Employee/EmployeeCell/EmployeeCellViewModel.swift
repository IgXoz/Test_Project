import Foundation

// MARK: EmployeeSectionViewModel
class EmployeeSectionViewModel: EmployeeSectionViewModelProtocol {
    var rows: [EmployeeCellViewModelProtocol] = []
}

// MARK: EmployeeCellViewModel
class EmployeeCellViewModel: EmployeeCellViewModelProtocol {
    
    var cellIdentifier: String {
        "EmployeeCell"
    }
    var cellHeight: Double { // лучше удалить
        100
    }
    var employeeName: String {
        employee.name
    }
    var employeePhoneNumber: String {
        employee.phoneNumber
    }
    var employeeSkill: [String] {
        employee.skills
    }
    private let employee: Employee
    
    required init(employee: Employee) {
        self.employee = employee
    }
}


