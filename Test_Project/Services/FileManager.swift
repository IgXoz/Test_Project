import Foundation

class FileManagers {
    
    private let manager = FileManager.default
    private var folderUrl: URL
    
    //            let dataString = "OneTwo".data(using: .utf8)
    
    func fetchCacheData() {
        
    }
    
    
    // Changing folderURL
    func createDirectory() {
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else {return}
        
        self.folderUrl = url.appendingPathComponent("EmployeeData")
    }
    
    //Saves Data and returns url adress
    func saveData(_ data: Data) -> (URL) {
         let fileUrl = folderUrl.appendingPathComponent("employeeData.txt")

            manager.createFile(atPath: fileUrl.path, contents: data, attributes: [FileAttributeKey.creationDate: Date()])
            return fileUrl
    }
    
    
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
    
    
    
    
    func something() {
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else {return}
        
        let folderUrl = url.appendingPathComponent("EmployeeData")
        
        //        manager.createDirectory(at: folderUrl,
        //                                        withIntermediateDirectories: true)
        let fileUrl = folderUrl.appendingPathComponent("employeeData.txt")
        let dataString = "OneTwo".data(using: .utf8)
        manager.createFile(atPath: fileUrl.path, contents: dataString, attributes: [FileAttributeKey.creationDate: Date()])
        
    }
    
    init(folderUrl: URL) {
        self.folderUrl = folderUrl
    }
    
}
