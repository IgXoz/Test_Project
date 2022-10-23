//
//  EmploeeViewController.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 20.10.2022.
//

import Foundation
import UIKit

class EmployeeViewController: UITableViewController {
    
    let employeeTableView = UITableView.init(frame: .zero, style: .grouped)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "reuseIdentifier") // азрегистрировали кастомную ячейку
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! EmployeeCell
//        configureCell(cell: cell, for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
}

private func configure(cell: UITableViewCell, indexPath: IndexPath) {
    
//    employeeTableView.register(EmployeeCell.self, forCellReuseIdentifier: "employeeCell")
    
    
    
    
//       if let cell = cell as? LineCell {
//           cell.lineLabel.text = NumberFormatter.localizedString(from:
//               NSNumber(value: indexPath.row + 1), number: .decimal)
//           cell.textView.text = book?.text[indexPath.row]
//       }
   }



