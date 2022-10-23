//
//  EmploeeViewController.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation
import UIKit

class EmployeeViewController: UITableViewController {
    
    // Временные заглушки, чтобы сконфигурировать ячейку
    private var employees: Welcome?
    private var employee: [Employee] = []
    
    //Создадим tableView во весь экран
    let employeeTableView = UITableView.init(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "reuseIdentifier") // азрегистрировали кастомную ячейку
    }
    //Переопределим методы протоколов UITableViewDataSourse & UITableViewDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! EmployeeCell
        cell.configure()//вызван метод-заглушка
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10 // временное значение
    }
    
}


