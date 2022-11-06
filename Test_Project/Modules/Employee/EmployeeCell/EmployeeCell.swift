import UIKit

class EmployeeCell: UITableViewCell, CellModelRepresentable { //ReusableIdentifier - протокол для identifier
    
    var viewModel: EmployeeCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }

    // MARK: SetupLabels
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    let skillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    //Поместим Лейблы в стэкВью
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       phoneNumberLabel,
                                                       skillLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()

    // MARK: Initializers
    //Переопределим инициализаторы, добавив функцию setupView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    // MARK: Methods
    private func setupView() {
        contentView.addSubview(stackView)

        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            margins.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -70),
            margins.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            margins.topAnchor.constraint(equalTo: stackView.topAnchor),
            margins.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? EmployeeCellViewModel else { return }
        nameLabel.text = viewModel.employeeName
        phoneNumberLabel.text = viewModel.employeePhoneNumber
        skillLabel.text = {
            var skills = ""
            for skill in viewModel.employeeSkill {
                skills += "\(skill), "
            }
            return skills
        }()
    }
    
}




