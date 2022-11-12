
import Foundation

//MARK: Decoder protocol
protocol DecoderProtocol {
    func decodeData(_ data: Data?, completion: @escaping (_ employee: [Employee])->())
}

//MARK: Decoder class
class Decoder: DecoderProtocol {
    
    //MARK: DecoderProtocol methods:
    func decodeData(_ data: Data?, completion: @escaping ([Employee]) -> ()) {
        if let localData = data {
            do {
                let welcome = try JSONDecoder().decode(Welcome.self, from: localData)
                let employees = welcome.company.employees
                completion(employees)
            } catch let error {
                print("Error serialization JSON ", error.localizedDescription)
            }
        } else {
            print("Data received by Decoder is empty (nil).")
        }
    }
    
}
