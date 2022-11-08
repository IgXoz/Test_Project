//
//  EmploeeInteractor.swift
import Foundation

class EmployeeInteractor: EmployeeInteractorProtocol {
    
    // MARK: Properties:
    weak var presenter: EmployeePresenterProtocol!
    let serverService: ServerServiceProtocol = ServerService()
    let fileManager: CacheManagerProtocol = CacheManager()
    let decoder: DecoderProtocol = Decoder()
    var fileUrl: URL? = URL(string:  "file:///Users/igor/Library/Developer/CoreSimulator/Devices/178E1B94-EAAC-4D8D-B8DA-7B91E0F1E020/data/Containers/Data/Application/505E7017-6AAB-4B97-8F8D-C08F0A4C153A/Documents/EmployeeData/employeeData.json") // need to be removed
    
    required init(presenter: EmployeePresenterProtocol) {
        self.presenter = presenter
    }
   
    // MARK: Methods:
    func fetchEmployeeInfo() {
        serverService.loadData { employees in
            let dataStore = EmployeeDataStore(employees: employees)
            self.presenter.employeeDidReceive(with: dataStore)
        }
    }
    
    //loads Data, sends Data to presenter and ViewModel, saves Data in cache,
    //returns fileUrl for cached Data.
    func fetchNetworkData() {
        serverService.loadNetworkData { data in
            self.decoder.decodeData(data) { employees in
                let dataStore = EmployeeDataStore(employees: employees)
                self.presenter.employeeDidReceive(with: dataStore)
            }
            self.fileManager.createDirectory()
            self.fileUrl = self.fileManager.saveData(data)
            print("file URL is: \(self.fileUrl)")
        }
    }
    
    
    func fetchCachedData() {
        serverService.loadCachedData(fileUrl) { data in
            self.decoder.decodeData(data) { employees in
                let dataStore = EmployeeDataStore(employees: employees)
                self.presenter.employeeDidReceive(with: dataStore)
            }
            self.fileManager.createDirectory() // need to be removed
            
            //        serverService.loadDataForCache { data in
            //
            //            self.fileManager.createDirectory()
            //
            //            self.decoder.decodeData(data) { employee in
            //
            //            }
            //
            //            self.fileUrl = self.fileManager.saveData(data)
            
        }
    }
}
