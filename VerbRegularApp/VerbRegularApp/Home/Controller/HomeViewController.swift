//
//  HomeViewController.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 27.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var titlelable: UILabel = {
        let lable = UILabel()
        lable.text = "Verregular".uppercased()
        lable.font = .boldSystemFont(ofSize: 28)
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        return lable
    }()
    
    private lazy var firstButton: UIButton = {
       let button = UIButton()
        button.setTitle("Select verbs".localized, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToSelectControler), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var secondButton: UIButton = {
       let button = UIButton()
        button.setTitle("Train verbs".localized, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToTraineController), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Properties
    private let cornerRadius: CGFloat = 20
    private let buttonHeight: CGFloat = 80
    private let buttonColor: UIColor = .systemGray5

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congigureUI()
    }
    
    //MARK: - Private methods
    @objc private func goToTraineController() {
        navigationController?.pushViewController(TraineViewController(), animated: true)
    }
    @objc private func goToSelectControler() {
        navigationController?.pushViewController(SelectViewController(), animated: true)
    }
    
    private func congigureUI() {
        view.addSubview(titlelable)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.backgroundColor = .white
        
        setUpContsraints()
    }
    private func setUpContsraints() {
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        
        titlelable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titlelable.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -80).isActive = true
        
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 40).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        secondButton.widthAnchor.constraint(equalTo: firstButton.widthAnchor).isActive = true
        
    }
}

