//
//  EmploeeInteractor.swift
import Foundation

class EmployeeInteractor: EmployeeBusinessLogicProtocol {
    
    // MARK: BusinesLogicData Methods:
    func loadData() {
        if checkCache() {
            fetchCachedData()
        } else {
            fetchNetworkData()
        }
        
    }
    // MARK: Properties:
    weak var presenter: EmployeePresentationLogicProtocol!
    let apiController: APIControllerProtocol = APIController()
    let decoder: DecoderProtocol = Decoder()
    private let urlStorage: URLStorageProtocol = URLStorage()
    let fileManager: CacheManagerProtocol = CacheManager()
    
    required init(presenter: EmployeePresentationLogicProtocol) {
        self.presenter = presenter
    }

    // MARK: Private methods:
    //loads Data, sends Data to presenter and ViewModel, saves Data in cache,
    //returns fileUrl for cached Data.
    private func fetchNetworkData() {
        apiController.loadDataFromServer { data in // <- returns Data from server.
            
            self.decoder.decodeData(data) { employees in // <- returns [Employee]
                let dataStore = EmployeeDataStore(employees: employees)
                self.presenter.employeeDidReceive(with: dataStore)// <- send [Employees] to presenter
            }
            
            let url = self.fileManager.createFile() // <-Creates file and returns fileURL
            self.urlStorage.saveURLIntoCache(url, self.urlStorage.key)// <- saves fileURL in UserDefaults
            
            self.fileManager.saveData(data, url) // <- saves Data into file
            print("file URL is: \(url)")
        }
    }
    
    private func fetchCachedData() {
        apiController.loadCachedData(self.urlStorage.getURLFromCache(self.urlStorage.key)) { data in // returns Data from Cache by using URL from userDefaults
            
            self.decoder.decodeData(data) { employees in // <- returns [Employee]
                let dataStore = EmployeeDataStore(employees: employees)
                self.presenter.employeeDidReceive(with: dataStore) // <- sends data to presenter
            }
        }
    }
    
    private func checkCache() -> Bool {
        if fileManager.ifFileExists(self.urlStorage.getURLFromCache(self.urlStorage.key)) {  // <- Check if file with cache Exists
           return true
        } else { return false }
    }
    
}
