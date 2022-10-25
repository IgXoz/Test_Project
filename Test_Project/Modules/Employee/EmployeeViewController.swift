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
    var employees: Welcome?
    var employee: [Employee] = []
    
    //необходимы для конфигурации
    var presenter: EmployeePresenterProtocol! // из этого экземпляра будем вызывать все методы презентора
    let configurator: EmployeeConfiguratorProtocol = EmployeeConfigurator()
    
    //Создадим tableView во весь экран
    let employeeTableView = UITableView.init(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "reuseIdentifier") // азрегистрировали кастомную ячейку
        
        configurator.configure(with: self)
        presenter.configureViewPresenter() //нужно реализовать метод
        
    }
    
    
    //Переопределим методы протоколов UITableViewDataSourse & UITableViewDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! EmployeeCell
        cell.configure()
        configureCell(cell: cell, for: indexPath) //вызван метод-заглушка
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employee.count
    }

    
    private func configureCell(cell: EmployeeCell, for indexPath: IndexPath) {
        let employee = employee[indexPath.row] // получили конкретный объект - персонаж
        cell.nameLabel.text = "Name: \(employee.name)"
        cell.phoneNumberLabel.text = "Phone Number: \(employee.phoneNumber)"
        cell.skillLabel.text = "Skills: \(employee.skills.count)"
    }
    
    override func viewDidAppear(_ animated: Bool) {

        tableView.reloadData()
    }
}
