//
//  EmployeeCellViewModel.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 05.11.2022.
//

import Foundation

class EmployeeSectionViewModel: EmployeeSectionViewModelProtocol {
    var rows: [EmployeeCellViewModelProtocol] = []
}

class EmployeeCellViewModel: EmployeeCellViewModelProtocol {
    
    var cellIdentifier: String {
        "EmployeeCell"
    }
    
    var cellHeight: Double {
        100
    }
    
    var employeeName: String {
        employee.name
    }
    var employeePhoneNumber: String {
        employee.phoneNumber
    }
    var employeeSkill: [String] {
        employee.skills
    }
    
    private let employee: Employee
    
    required init(employee: Employee) {
        self.employee = employee
    }
}


