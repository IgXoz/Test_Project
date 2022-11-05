//
//  ServerService.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation


protocol ServerServiceProtocol {
    
    // let jsonAdress: String . Perhaps not required
    // func getServerData
    func loadData(completion: @escaping (_ employee: [Employee])->())
    
}


class ServerService: ServerServiceProtocol {
    
    // MARK: - ServerServiceProtocol methods:
    func loadData(completion: @escaping (_ employees: [Employee])->()) {
            guard let url = URL(string: employeeJson) else {return}
            URLSession.shared.dataTask(with: url) { data, responce, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No error description")
                    return}
                do {
                    let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                    let employees = welcome.company.employees

                    // необходимо перезагрузить методы протокола UITableViewDataSource
                    // тк обновление методов протокола - это обновление интерфейса, то делаем асинхронно
                    
                    //мы создаем массив employees, нам необходимо его захватить и передать в массив в интеракторе - делаем через комплишн
                    completion(employees)
                } catch let error {
                    print("Error serialization JSON ", error.localizedDescription)
                }
            } .resume()
        print("serverSide") // s/b removed
        
}

    // MARK: - Private properties:
    private let employeeJson =  "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"

}

