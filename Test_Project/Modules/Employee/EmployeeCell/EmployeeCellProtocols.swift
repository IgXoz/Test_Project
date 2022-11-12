import Foundation

// MARK: EmployeeCellViewModelProtocol
protocol EmployeeCellViewModelProtocol {
    var cellIdentifier: String { get }
    var employeeName: String { get }
    var employeePhoneNumber: String { get }
    var employeeSkill: [String] { get }
    init(employee: Employee)
}

// MARK: EmployeeSectionViewModelProtocol
protocol EmployeeSectionViewModelProtocol {
    var rows: [EmployeeCellViewModelProtocol] { get }
}

// MARK: CellModelRepresentable
protocol CellModelRepresentable {
    var viewModel: EmployeeCellViewModelProtocol? { get }
}
