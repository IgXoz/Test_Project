import Foundation

protocol EmployeeCellViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
    var employeeName: String { get }
    var employeePhoneNumber: String { get }
    var employeeSkill: [String] { get }
    init(employee: Employee)
}

protocol EmployeeSectionViewModelProtocol {
    var rows: [EmployeeCellViewModelProtocol] { get }
}

protocol CellModelRepresentable {
    var viewModel: EmployeeCellViewModelProtocol? { get }
}

// MARK: Протокол для identifier:
//protocol ReusableIdentifier: AnyObject {
//    static var reuseIdentifier: String { get }
//}
//
//extension ReusableIdentifier {
//    static var reuseIdentifier: String {
//        return "\(self)"
//    }
//}
