//Need to implement DTO models. These models should be used for fetched Data

import Foundation

// MARK: - Welcome
struct WelcomeDTO: Codable {
    let company: Company?
}

// MARK: - Company
struct CompanyDTO: Codable {
    let name: String?
    let employees: [Employee?]
    
//    enum CodingKeys: String, CodingKey {
//        case name = ""
////        case employeess = ???
//    }
}

// MARK: - Employee
struct EmployeeDTO: Codable {
    let name, phoneNumber: String?
    let skills: [String?]

    //использовать нативную апишку для конвертации snakeCase в camelCase
    enum CodingKeys: String, CodingKey {
        case name = "Name (default)"
        case phoneNumber = "Phone number (default)"
        case skills = "Skills (default)"
    }
}


