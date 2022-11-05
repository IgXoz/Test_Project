//
//  EmployeeCell.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 23.10.2022.
//

import UIKit

class EmployeeCell: UITableViewCell, CellModelRepresentable { //ReusableIdentifier
    
    var viewModel: EmployeeCellViewModelProtocol? {
        didSet {
            updateView()
        }
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
    
    //--------------
    
    //Настроим лейблы 
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
    
    //Поместим Лейблы в стэкВью, чтобы их с лейблами было удобнее работать
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       phoneNumberLabel,
                                                       skillLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
//        stackView.backgroundColor = .gray
        return stackView
    }()

    //Переопределим инициализаторы, добавив функцию setupView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    //Приватная функция для настройки стэкВью
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
    
    //Временный метод, чтобы наполнить ячейку во вьюКонтроллере, метод должен
    //быть изменен
    func configure() {
//        nameLabel.text = "Name_Test"
//        phoneNumberLabel.text = "PhoneNumber_Test"
//        skillLabel.text = "Skills_Test"
        
    }
  
}




