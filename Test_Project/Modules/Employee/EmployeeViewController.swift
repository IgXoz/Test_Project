//
//  EmploeeViewController.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import UIKit

class EmployeeViewController: UITableViewController, EmployeeViewProtocol {
    
    var presenter = EmployeePresenterProtocol!
    let configurator: EmployeeConfiguratorProtocol = EmployeeConfigurator()
    
    
    override func viewdidload() {
        
        super.viewdidload() 
        configurator.configure(with: self)
        presenter.configureView() //нужно реализовать метод
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
