import Foundation

// MARK: CacheManagerProtocol:
protocol CacheManagerProtocol {
    func createFile()-> (URL?)
    func saveData(_ data: Data, _ fileURL: URL?)
    func deleteData(_ fileURL: URL?)
    func ifFileExists(_ fileURL: URL?) -> Bool
}

// MARK: CacheManager:
class CacheManager: CacheManagerProtocol {
    
    // MARK: Private properties:
    private let manager = FileManager.default
    private var fileUrl: URL!
    
    // MARK: CacheManagerProtocol methods:
    
    // Creates file
    func createFile()-> (URL?) {
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else { return nil}
        let folderUrl = url.appendingPathComponent("EmployeeData")
        
        let fileURL = folderUrl.appendingPathComponent("employeeData.JSON")
        self.fileUrl = fileURL
        return fileURL
    }
    
    //Saves Data and returns URL adress for cache-file.
    func saveData(_ data: Data, _ fileURL: URL?) {
        manager.createFile(atPath: fileUrl.path, contents: data, attributes: [FileAttributeKey.creationDate: Date()])
    }
    
    //  Removes file.
    func deleteData(_ fileURL: URL?) {
        if ifFileExists(fileURL) {
            print("File exists")
            if let url = fileURL {
                do {
                    try manager.removeItem(at: url)
                    print("File removed successfully.")
                } catch {
                    print(error)
                }
            }
        } else { print ("File Not Exists") } 
    }
    
    // Checks if file exists.
    func ifFileExists(_ fileURL: URL?) -> Bool {
        if let url = fileURL {
            if manager.fileExists(atPath: url.path) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
