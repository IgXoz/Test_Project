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
    var viewEmployee: [Employee] = []
    
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
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "reuseIdentifier") // зарегистрировали кастомную ячейку
//        setupLayout()
        configurator.configure(with: self)
        dataLoaded()
    }
    
    // MARK: UITableViewDataSourse & UITableViewDelegate methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! EmployeeCell
//        cell.configure()
                configureCell(cell: cell, for: indexPath)
        print("4 employee: \(viewEmployee)")//вызван метод-заглушка
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//                employee.count
        4
    }
    
    private func dataLoaded() {
        presenter.configureViewPresenter(completion: { presenterEmployee in
            
            self.viewEmployee = presenterEmployee
            self.employeeTableView.reloadData()
            print("Employee in loadDataView is \(self.viewEmployee)")
            print("EmployeeClosure in loadDataPresenter is \(presenterEmployee)")
            
//            completion(self.viewEmployee)
        })
        
        print ("ViewController empoyee: \(self.viewEmployee)")
        
//        DispatchQueue.main.async {
//            self.titleInfo.text = planetInfo.title
//            self.dateInfo.text = planetInfo.date
////                self.explanationInfo.text = planetInfo.explanation
//            self.textView.text = planetInfo.explanation
        
        
        DispatchQueue.main.async {
            self.employeeTableView.reloadData()
        }
    }
    
    private func configureCell(cell: EmployeeCell, for indexPath: IndexPath) {
//        let employee = employee[indexPath.row] // получили конкретный объект - персонаж
        print ("Empl \(self.viewEmployee)")
            cell.nameLabel.text = "Name: (employee.name)"
            cell.phoneNumberLabel.text = "Phone Number: (employee.phoneNumber)"
            cell.skillLabel.text = "Skills: (employee.skills.count)"
        }
       
    
    
    private func dataLoaded1() {
        
        
        presenter.configureViewPresenter(completion: { presenterEmployee in
            
            self.viewEmployee = presenterEmployee
            self.employeeTableView.reloadData()
            print("Employee in loadDataView is \(self.viewEmployee)")
            print("EmployeeClosure in loadDataPresenter is \(presenterEmployee)")
            
//            completion(self.viewEmployee)
        })
        
        print ("ViewController empoyee: \(self.viewEmployee)")
        
//        DispatchQueue.main.async {
//            self.titleInfo.text = planetInfo.title
//            self.dateInfo.text = planetInfo.date
////                self.explanationInfo.text = planetInfo.explanation
//            self.textView.text = planetInfo.explanation
        
        
        DispatchQueue.main.async {
            self.employeeTableView.reloadData()
        }
    }
    
    
    }
    

