//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Dyadichev on 09.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: -
    
    // Создаем контанту для нашего фона приложения.
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        // Задаем изображение которое будет отображаться
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Создаем текстовый лейбл
    private let calculateLabel: UILabel = {
        let label = UILabel()
        label.text = "Calculate your BMI"
        label.font = .boldSystemFont(ofSize: 35)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        //Цвет текста на кнопке
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 3.0
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let height: UILabel = {
       let label = UILabel()
        label.text = "2.0"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightSlider: UISlider = {
       let slider = UISlider()
        slider.maximumValue = 200
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let weightLabel: UILabel = {
       let label = UILabel()
        label.text = "Weight"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weight: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.text = "200"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - IB Actions
    
    @objc private func calculateButtonPressed() {
        
        print("test")
    }
    
    //MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImage)
        view.addSubview(calculateLabel)
        view.addSubview(calculateButton)
        view.addSubview(heightSlider)
        view.addSubview(weightSlider)
        view.addSubview(heightLabel)
        view.addSubview(height)
        view.addSubview(weightLabel)
        view.addSubview(weight)
        setConstraints()
    }
    
    
}

//MARK: - Extensions Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            calculateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            calculateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            heightSlider.bottomAnchor.constraint(equalTo: calculateButton.bottomAnchor,constant: -140),
            heightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightSlider.widthAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            heightLabel.bottomAnchor.constraint(equalTo: heightSlider.bottomAnchor,constant: -40),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 60)
        ])
        NSLayoutConstraint.activate([
            height.bottomAnchor.constraint(equalTo: heightSlider.bottomAnchor,constant: -35),
            height.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -60)
        ])
        NSLayoutConstraint.activate([
            weightSlider.topAnchor.constraint(equalTo: heightSlider.topAnchor,constant: 70),
            weightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightSlider.widthAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            weightLabel.bottomAnchor.constraint(equalTo: weightSlider.bottomAnchor,constant: -40),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 60)
        ])
        NSLayoutConstraint.activate([
            weight.topAnchor.constraint(equalTo: weightSlider.topAnchor,constant: -27),
            weight.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -60)
        ])
    }
}

