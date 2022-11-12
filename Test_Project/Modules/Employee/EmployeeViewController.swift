import UIKit

class EmployeeViewController: UITableViewController, EmployeeDisplayLogicProtocol {
    
    // MARK: Properties:
    var presenter: EmployeePresentationLogicProtocol!
    private let configurator: EmployeeConfiguratorProtocol = EmployeeConfigurator()
    private var sectionViewModel: EmployeeSectionViewModelProtocol = EmployeeSectionViewModel()
    
    // MARK: Methods
    func reloadData(for section: EmployeeSectionViewModel) {
        sectionViewModel = section
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "Check Internet Connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func setUpConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: LifeCycle Methods:
    override func loadView() {
        super.loadView()
        setUpConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "EmployeeCell")
        configurator.configure(with: self)
        presenter.displayData()
    }
}
    
// MARK: - UITableViewDataSource, UITableViewDelegate
extension EmployeeViewController {

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       sectionViewModel.rows.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! EmployeeCell
        cell.viewModel = cellViewModel
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


