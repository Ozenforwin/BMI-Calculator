//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by Dyadichev on 11.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
// MARK: - Variables, Constant
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    var image: String?
    
// MARK: - UILable, UIImage
    
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
    
    private let adviceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//MARK: - IB Actions
    
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
    
//MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resultLabel)
        view.addSubview(titleLabel)
        view.addSubview(adviceLabel)
        view.addSubview(adviceImage)
        view.addSubview(recalculateButton)
        
        adviceImage.image = UIImage(named: image!)
        view.backgroundColor = color
        
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
        NSLayoutConstraint.activate([
            adviceImage.topAnchor.constraint(equalTo: adviceLabel.bottomAnchor,constant: 40),
            adviceImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adviceImage.widthAnchor.constraint(equalToConstant: 150),
            adviceImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
