//
//  EmployeeCell.swift
//  Test_Project
//
//  Created by Igor a Stepanov on 23.10.2022.
//

import UIKit

final class EmployeeCell: UITableViewCell, ReusableIdentifier {
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
    
    
    
// not required
    let textView: UITextView = {
        let view = UITextView()
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.isEditable = false
        view.isScrollEnabled = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, phoneNumberLabel, skillLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        contentView.addSubview(stackView)

        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            margins.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            margins.topAnchor.constraint(equalTo: stackView.topAnchor),
            margins.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
}

// Not sure if this protocol is required
protocol ReusableIdentifier: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableIdentifier {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}
