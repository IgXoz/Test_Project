//import Foundation
import UIKit

class EmployeeViewController: UITableViewController, EmployeeViewProtocol {
    
    
    // MARK: Properties:
    var presenter: EmployeePresenterProtocol!
    private let configurator: EmployeeConfiguratorProtocol = EmployeeConfigurator()
    private var sectionViewModel: EmployeeSectionViewModelProtocol = EmployeeSectionViewModel()
    private var employeeTableView: UITableView {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    // MARK: Methods
    func reloadData(for section: EmployeeSectionViewModel) {
        sectionViewModel = section
        employeeTableView.reloadData()
    }
    
    // MARK: Override methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(employeeTableView) // required?
        employeeTableView.register(EmployeeCell.self, forCellReuseIdentifier: "EmployeeCell") // зарегистрировали кастомную ячейку
        configurator.configure(with: self)
        presenter.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        employeeTableView.frame = view.bounds
    }

    // MARK: UITableViewDataSource, UITableViewDelegate:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! EmployeeCell
        cell.viewModel = cellViewModel
        return cell
    }
    
    override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
    
    }
    

//// MARK: - UITableViewDataSource
//extension EmployeeViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        sectionViewModel.rows.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellViewModel = sectionViewModel.rows[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! EmployeeCell
//        cell.viewModel = cellViewModel
//        return cell
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension EmployeeViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
//    }
//}
