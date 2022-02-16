//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by Dyadichev on 11.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue = "0.0"
    
   lazy var resultLabel: UILabel = {
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
    
    private let recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Recalculate", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func recalculateButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resultLabel)
        view.addSubview(titleLabel)
        view.addSubview(recalculateButton)
//        resultLabel.text = bmiValue
        
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
        NSLayoutConstraint.activate([
            recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
}
