
// Need to implement observer into project

import Foundation
import Network

extension Notification.Name {
    static let connectivityStatus = Notification.Name(rawValue: "connectivityStatusChanged")
}

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .other,
        .wifi,
        .cellular,
        .loopback,
        .wiredEthernet
    ]
}

final class NetworkMonitor {
    static let shared = NetworkMonitor()

    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor")
    private let monitor: NWPathMonitor

    private(set) var isConnected = false
    private(set) var isExpensive = false
    private(set) var currentConnectionType: NWInterface.InterfaceType?

    private init() {
        monitor = NWPathMonitor()
    }

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.isExpensive = path.isExpensive
            self?.currentConnectionType = NWInterface.InterfaceType.allCases.filter { path.usesInterfaceType($0) }.first
            
            NotificationCenter.default.post(name: .connectivityStatus, object: nil)
        }
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
    

    
}




//extension NSNotification.Name {
//    static let networkMonitorPathUpdated = NSNotification.Name("NWNetworkMonitorPathUpdated")
//}
//
//extension NWPath {
//    var isConnected: Bool {
//        status != .unsatisfied
//    }
//}
//
//// где-нибудь в коде приложения:
//let mySharedNetworkMonitor = NWPathMonitor(requiredInterfaceType: <...>)
//mySharedNetworkMonitor.pathUpdateHandler = { _ in
//    NotificationCenter.shared.post(name: .networkMonitorPathUpdated,
//                                   object: mySharedNetworkMonitor)
//  // ... и даже наплевать на retain-cycle, т.к. судя по статье
//  // этот объект всё равно собирался жить вечно как static var shared = ...
//}
//
//// Зачем нужна какая-то особая очередь для получения этих уведомлений,
//// мне тоже не понятно. Всё равно реагировать на эти события в большинстве случаев придётся в UI.
//mySharedNetworkMonitor.start(queue: .main)
//
//// Не представляю в какой момент и зачем кому-то захочется сделать stop.
//// Но если очень хочется, то можно:
//mySharedNetworkMonitor.stop()
//
//NotificationCenter.shared
//  .addObserver(forName: .networkMonitorPathUpdated,
//               object: mySharedNetworkMonitor,
//               queue: .main) { note in
//  // если монитор всегда один,
//  // то можно читать прям из mySharedNetworkMonitor
//  let monitor = note.object as! NWPathMonitor
//
//  // читаем прямо из NWPathMonitor, используя Network API на 100%
//  print("connected:", monitor.currentPath.isConnected)
//}
