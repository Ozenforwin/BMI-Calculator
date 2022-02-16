//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by Dyadichev on 11.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String = "0.0"
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.textColor = .white
        label.text = bmiValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.textColor = .white
        label.text = "YOUR RESULT"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resultLabel)
        view.addSubview(titleLabel)
        
        
        setConstraints()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
}
// MARK: - SetConstraints

extension ResultViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 40),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
