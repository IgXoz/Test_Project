//
//  EmploeeProtocols.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

protocol EmployeeViewProtocol: class {
    
    
    
    
    
    
    
    func setInputValue(with value: String?)
    func setOutputValue(with value: String?)
//    func setInputCurrencyShortName(with shortName: String)
//    func setOutputCurrencyShortName(with shortName: String)
//    func addDoneOnInputCurrencyKeyboard()
//    func showHUD()
//    func showLoadCurrenciesButton()
//    func hideHUD()
//    func showAlertView(with text: String)
//    func showPickerView()
//    func hidePickerView()
//    func hideKeyboard()
//    func setRateText(with rateText: String)
}

protocol EmployeePresenterProtocol: class {
    
    var router: EmployeeRouterProtocol! { set get } // 
    func configureView() // метод инициалищирует и конфигурирует первоначальные данные для визуальных элементов во вьюконтроллере.
    
    
    
    
    
//    var rateText: String { get }
    func textFieldDidBeginEditing()
    func inputValueChanged(to newInputValue: String)
    func inputValueCleared()
//    func inputCurrencyButtonClicked()
//    func outputCurrencyButtonClicked()
//    func loadCurrenciesButtonClicked()
//    func infoButtonClicked()
//    func showHUD()
//    func showLoadCurrenciesButton()
//    func hideHUD()
    func updateOutputValue()
//    func showAlertView(with text: String)
//    func inputCurrencyNameUpdated()
//    func outputCurrencyNameUpdated()
//    func updateRateText()
}

protocol EmployeeInteractorProtocol: class {
    
    
    
    
    
    
    var inputValue: Double { set get }
    var outputValue: Double { get }
//    var inputCurrencyShortName: String { get }
//    var outputCurrencyShortName: String { get }
//    var inputCurrencyIndex: Int { get }
//    var outputCurrencyIndex: Int { get }
//    var outputCurrencyRatio: Double { get }
//    func getAllCurrencies()
//    func getCurrencyNames() -> [String]
//    func inputCurrencyChanging()
//    func outputCurrencyChanging()
//    func currencyChanged(selectedIndex: Int)
}

protocol EmployeeRouterProtocol: class {
    
    
    
    
    
    func showAboutScene()
//    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol EmployeeConfiguratorProtocol: class {
    
    
    
    
    
    
    func configure(with viewController: EmployeeViewController)
}
