//
//  EmploeeProtocols.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation

protocol EmployeeViewProtocol: class {
    
    // методы для заполнения лейблов во вью контроллере
    func setNameTitle()
    func setPhoneNumberTitle()
    func setSkillsTitle()
    
    
    
    
    
    
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
    
    //должен иметь router и методы, которые вызываются при нажатии на ячейку/кнопку
    
    var router: EmployeeRouterProtocol! { set get } // 
    func configureView() // метод инициализирует и конфигурирует первоначальные
    //данные для визуальных элементов во вьюконтроллере.
    
    func cellClicked() // вызывается при тапе на ячейку
    
    
    
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
    
    //внутри этого метода конфигурируется модуль
    
}
