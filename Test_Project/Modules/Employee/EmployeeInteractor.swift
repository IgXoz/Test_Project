//
//  EmploeeInteractor.swift
import Foundation

class EmployeeInteractor: EmployeeBusinessLogicProtocol {
    
    // MARK: BusinesLogicData Methods:
    func loadData() {
        let _ = Timer.scheduledTimer(withTimeInterval: TimeConstants.checkInterval, repeats: false) { timer in
            self.observeNetwork()
        }

        if checkCache() {
            fetchCachedData()
        } else {
            fetchNetworkData()
            startTimer()
        }
    }
    
    // MARK: Properties:
    weak var presenter: EmployeePresentationLogicProtocol!
    let apiController: APIControllerProtocol = APIController()
    let decoder: DecoderProtocol = Decoder()
    private let urlStorage: URLStorageProtocol = URLStorage()
    let fileManager: CacheManagerProtocol = CacheManager()

    
    // MARK: Init:
    required init(presenter: EmployeePresentationLogicProtocol) {
        self.presenter = presenter
    }

}

// MARK: Fetch Data Methods
extension EmployeeInteractor {
    private func fetchCachedData() {
        apiController.loadCachedData(self.urlStorage.getURLFromCache(self.urlStorage.key)) { data in // returns Data from Cache by using URL from userDefaults
            
            self.decoder.decodeData(data) { employees in // <- returns [Employee]
                let dataStore = EmployeeDataStore(employees: employees)
                self.presenter.employeeDidReceive(with: dataStore) // <- sends data to presenter
            }
        }
    }
    
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
        }
    }
}

// MARK: Cache methods:
extension EmployeeInteractor {
    private func checkCache() -> Bool {
        if fileManager.ifFileExists(self.urlStorage.getURLFromCache(self.urlStorage.key)) {  // <- Check if file with cache Exists
            
           return true
        } else { return false }
    }
}

// MARK: Extension Timer Methods:
extension EmployeeInteractor {
    private func startTimer() {
        let _ = Timer.scheduledTimer(withTimeInterval: TimeConstants.hour, repeats: false) { timer in
            self.fileManager.deleteData(self.urlStorage.getURLFromCache(self.urlStorage.key)) // calls deleteData method
            print("Interactor removed cache")
        }
    }
}
    
// MARK: Extension NetworkConnection Methods:
extension EmployeeInteractor {
    
    // Adds Observer for network connectivity:
    func observeNetwork() {
        NotificationCenter.default.addObserver(self, selector: #selector(checkConnection), name: .connectivityStatus, object: nil)
    }
    
    @objc private func checkConnection() {
        if  NetworkMonitor.shared.isConnected {
            presenter.showAlert()
        } else {
            print ("It works")
        }
    }
}

// MARK: Enum with Time Consts:
    enum TimeConstants {
        fileprivate static let hour: Double = 3600
        fileprivate static let checkInterval: Double = 3
    }
