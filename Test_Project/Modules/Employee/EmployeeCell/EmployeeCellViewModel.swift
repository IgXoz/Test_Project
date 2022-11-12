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

    var employeeName: String {
    "Name: \(employee.name)"
    }
    var employeePhoneNumber: String {
        "Phone number: \(employee.phoneNumber)"
    }
    var employeeSkill: [String] {
       employee.skills
    }
    private let employee: Employee
    
    required init(employee: Employee) {
        self.employee = employee
    }
}


