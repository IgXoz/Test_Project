//
//  EmploeeViewController.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//


import Foundation
import UIKit

class EmployeeViewController: UITableViewController, EmployeeViewProtocol {
    
    // Временные заглушки, чтобы сконфигурировать ячейку
//    var viewEmployee: [Employee] = []
    
    private var sectionViewModel: EmployeeSectionViewModelProtocol = EmployeeSectionViewModel()
    
    //необходимы для конфигурации
    var presenter: EmployeePresenterProtocol! // из этого экземпляра будем вызывать все методы презентора
    let configurator: EmployeeConfiguratorProtocol = EmployeeConfigurator() // конфигурирует вьюконтроллер
    
    //Создадим tableView
    private var employeeTableView: UITableView {
            let tableView = UITableView.init(frame: .zero, style: .grouped)
            tableView.translatesAutoresizingMaskIntoConstraints = false
                return tableView
    }
    
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
    
    //Delete method
    private func configureCell(cell: EmployeeCell, for indexPath: IndexPath) {
//        let employee = employee[indexPath.row] // получили конкретный объект - персонаж
//        print ("Empl \(self.viewEmployee)")
            cell.nameLabel.text = "Name: (employee.name)"
            cell.phoneNumberLabel.text = "Phone Number: (employee.phoneNumber)"
            cell.skillLabel.text = "Skills: (employee.skills.count)"
        }
       
    
    func reloadData(for section: EmployeeSectionViewModel) {
        sectionViewModel = section
        employeeTableView.reloadData()
    }
    
    
    
    
    //-----
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

//// MARK: UITableViewDataSourse & UITableViewDelegate methods
//override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = employeeTableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! EmployeeCell
////        cell.configure()
////                configureCell(cell: cell, for: indexPath)
//    print("4 employee: \(viewEmployee)")//вызван метод-заглушка
//    return cell
//}
//
//override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////                employee.count
//    4
//}
