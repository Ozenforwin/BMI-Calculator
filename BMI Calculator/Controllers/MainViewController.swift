//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Dyadichev on 09.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - UI
    
    var calculatorBrain = CalculatorBrain()
    
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
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .gray
        slider.value = 1.5
        slider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
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
    
    private let metreHeightLabel: UILabel = {
       let label = UILabel()
        label.text = "1.50cm"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightSlider: UISlider = {
       let slider = UISlider()
        slider.maximumValue = 200
        slider.value = 100
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .gray
        slider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
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
    
    private let kgWeightSlider: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.text = "100kg"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - IB Actions
    
    @objc private func calculateButtonPressed() {
        
        let weight = weightSlider.value
        let height = heightSlider.value
        let bmi = calculatorBrain.calculateBMI(weight: weight, height: height)
        
        let resultVC = ResultViewController()
        
        resultVC.bmiValue = calculatorBrain.getBMIValue()
        resultVC.advice = calculatorBrain.getAdvice()
        resultVC.color = calculatorBrain.getColor()
        
        self.present(resultVC, animated: true, completion: nil)
    }
    
    @objc private func heightSliderChanged() {
        let height = String(format: "%.2f", heightSlider.value)
        metreHeightLabel.text = "\(height)cm"
    }
    
    @objc private func weightSliderChanged() {
        let weight = String(format: "%.0f", weightSlider.value)
        kgWeightSlider.text = "\(weight)kg"
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
        view.addSubview(metreHeightLabel)
        view.addSubview(weightLabel)
        view.addSubview(kgWeightSlider)
        
        setConstraints()
    }
}

//MARK: - Set Constraints

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
            metreHeightLabel.bottomAnchor.constraint(equalTo: heightSlider.bottomAnchor,constant: -35),
            metreHeightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -60)
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
            kgWeightSlider.topAnchor.constraint(equalTo: weightSlider.topAnchor,constant: -27),
            kgWeightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -60)
        ])
    }
}

