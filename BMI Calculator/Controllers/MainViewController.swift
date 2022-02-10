//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Dyadichev on 09.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // Создаем контанту для нашего фона приложения.
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        // Задаем изображение которое будет отображаться
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        return imageView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImage)
        setConstraints()

        
    }


}

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        
        
        
        ])
        
        
    }
    
    
    
}

