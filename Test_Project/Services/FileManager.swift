import Foundation

// MARK: CacheManagerProtocol:
protocol CacheManagerProtocol {
    func fetchCacheData()
    func createDirectory()
    func saveData(_ data: Data) -> (URL)
    func deleteData(_ fileURL: URL)
}

// MARK: CacheManager:
class CacheManager: CacheManagerProtocol {
    
    // MARK: Private properties:
    private let manager = FileManager.default
    private var folderUrl: URL!

    
    // MARK: CacheManagerProtocol methods:
    func fetchCacheData() { // Need to be deleted
        
    }
    
    // Changing folderURL
    func createDirectory() { // Need to check if Directory exists before trying to create it
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else { return }
        self.folderUrl = url.appendingPathComponent("EmployeeData")
        print("Folder URL is \(folderUrl.path)")
    }
    
    //Saves Data and returns URL adress for cache-file.
    func saveData(_ data: Data) -> (URL) {
        createDirectory() // perhaps, needs to be deleted
         let fileUrl = folderUrl.appendingPathComponent("employeeData.JSON")
            manager.createFile(atPath: fileUrl.path, contents: nil, attributes: [FileAttributeKey.creationDate: Date()])
            return fileUrl
    }
    
    // Checks if file exists and removes file.
    func deleteData(_ fileURL: URL) {
        if manager.fileExists(atPath: fileURL.path) {
            print("File exists")
            do {
                try manager.removeItem(at: fileURL)
                print("File removed successfully.")
            } catch {
                print(error)
            }
        }
    }
    
}
