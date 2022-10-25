//
//  ServerService.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation


protocol ServerServiceProtocol {
    
}


class ServerService {
    
    static func loadData(completion: @escaping (_ employee: [Employee])->()) {

            guard let url = URL(string: employeeJson) else {return}
            URLSession.shared.dataTask(with: url) { data, responce, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No error description")
                    return}
                do {
                    let employees = try JSONDecoder().decode(Welcome.self, from: data)
                    let employee = employees.company.employees

                    // необходимо перезагрузить методы протоколо UITableViewDataSource
                    // тк обновление методов протокола - это обновление интерфейса? то делаем асинхронно
                    
                    //мы создаем массив personages, нам необходимо его захватить и передать в массив во вью контроллере - делаем через комплишн
                    completion(employee)
                } catch let error {
                    print("Error serialization JSON bla-bla", error.localizedDescription)
                }
            } .resume()
        print("serverSide")
}
    
}

