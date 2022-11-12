// This file is used to save URL adress for cached files and for Timer parametrs

import Foundation

protocol URLStorageProtocol {
    func saveURLIntoCache(_ url: URL?,_ key: String)
    func getURLFromCache(_ key: String)-> URL?
    var key: String { get }
}

class URLStorage: URLStorageProtocol {
    
    let key = "EmployeeDataFileUrl"
    func saveURLIntoCache(_ url: URL?,_ key: String) {
        if UserDefaults.standard.url(forKey: key) == nil {
            UserDefaults.standard.set(url, forKey: key)
        } else {
            return
        }
    }
    
    func getURLFromCache(_ key: String)-> URL? {
        UserDefaults.standard.url(forKey: key)
    }
}
