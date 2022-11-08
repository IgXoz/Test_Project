import Foundation


protocol ServerServiceProtocol {
    func loadData(completion: @escaping (_ employee: [Employee])->())
}

class ServerService: ServerServiceProtocol {
    
    // MARK: - Private properties:
    private let employeeJson =  "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    
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
                    completion(employees)
                } catch let error {
                    print("Error serialization JSON ", error.localizedDescription)
                }
            } .resume()
}


}

