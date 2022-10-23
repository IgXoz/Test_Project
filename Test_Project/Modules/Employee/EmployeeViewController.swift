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
    private var employees: Welcome?
    private var employee: [Employee] = []
    
    //необходимы для конфигурации
    var presenter = EmployeePresenterProtocol!
    let configurator: EmployeeConfiguratorProtocol = EmployeeConfigurator()
    
    //Создадим tableView во весь экран
    let employeeTableView = UITableView.init(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "reuseIdentifier") // азрегистрировали кастомную ячейку
        
//        configurator.configure(with: self)
//        presenter.configureView() //нужно реализовать метод
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
    
    
    
   
    

    
    
    
    
    
    
    
    func setInputValue(with value: String?) {
        <#code#>
    }
    
    func setOutputValue(with value: String?) {
        <#code#>
    }
    
    func setInputCurrencyShortName(with shortName: String) {
        <#code#>
    }
    
    func setOutputCurrencyShortName(with shortName: String) {
        <#code#>
    }
    
    func addDoneOnInputCurrencyKeyboard() {
        <#code#>
    }
    
    func showHUD() {
        <#code#>
    }
    
    func showLoadCurrenciesButton() {
        <#code#>
    }
    
    func hideHUD() {
        <#code#>
    }
    
    func showAlertView(with text: String) {
        <#code#>
    }
    
    func showPickerView() {
        <#code#>
    }
    
    func hidePickerView() {
        <#code#>
    }
    
    func hideKeyboard() {
        <#code#>
    }
    
    func setRateText(with rateText: String) {
        <#code#>
    }
    
    
}
