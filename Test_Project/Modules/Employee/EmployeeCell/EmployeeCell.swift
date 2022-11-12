import UIKit

class EmployeeCell: UITableViewCell, CellModelRepresentable {
    
    var viewModel: EmployeeCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    // MARK: SetupSubViews
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = Constants.viewBorderWidth
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Fonts.mediumBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Fonts.medium
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    private lazy var  skillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Fonts.medium
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()

    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
            setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraints()
    }

    // MARK: Private Methods
    private func setupView() {
        contentView.addSubview(containerView)

        containerView.addSubview(nameLabel)
        containerView.addSubview(phoneNumberLabel)
        containerView.addSubview(skillLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.cellsSpacing),
            
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Constants.labelsSpacing),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Constants.labelsSpacing),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.labelsSpacing),

            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            phoneNumberLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            phoneNumberLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            phoneNumberLabel.bottomAnchor.constraint(equalTo: skillLabel.topAnchor),

            skillLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            skillLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            skillLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.labelsSpacing)
        ])
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? EmployeeCellViewModel else { return }
        nameLabel.text = viewModel.employeeName
        phoneNumberLabel.text = viewModel.employeePhoneNumber
        skillLabel.text = "Skills: \(viewModel.employeeSkill.joined(separator: ", "))"
    }
    
    // MARK: Constants
    enum Constants {
        fileprivate static let labelsSpacing: CGFloat = 5
        fileprivate static let cellsSpacing: CGFloat = 5
        fileprivate static let viewBorderWidth: CGFloat = 0.5
    }
}




