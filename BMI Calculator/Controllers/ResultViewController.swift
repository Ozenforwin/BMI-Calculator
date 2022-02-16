//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by Dyadichev on 11.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
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
    
    lazy var adviceLabel: UILabel = {
        let label = UILabel()
        label.text = advice
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
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
        view.addSubview(adviceLabel)
        view.addSubview(recalculateButton)
        view.backgroundColor = color
        
        //        resultLabel.text = bmiValue
        
        setConstraints()
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
        NSLayoutConstraint.activate([
            adviceLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor,constant: 40),
            adviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adviceLabel.widthAnchor.constraint(equalToConstant: 400)
        ])
        
    }
}
