//
//  ProfileViewController.swift
//  Movies
//
//  Created by Yernar Masujima on 8/10/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundColor
        button.layer.cornerRadius = 22
        button.tintColor = .titleColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24 , weight: .medium)
        label.text = "Yernar Masujima"
        label.textColor = .titleColor
        return label
    }()
    
    private lazy var infomationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Male | Born 22.11.1999"
        label.textColor = .textColor
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.cornerRadius = 100
        imageView.layer.borderColor = UIColor.backgroundColor.cgColor
        imageView.layer.borderWidth = 5
        imageView.tintColor = .backgroundColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "+7 (747) 119-05-88"
        label.textColor = .textColor
        return label
    }()
    
    private lazy var emailAddressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "masujima.ernar@gmail.com"
        label.textColor = .textColor
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var phoneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundColor
        button.layer.cornerRadius = 40
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.tintColor = .titleColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "phone"), for: .normal)
        return button
    }()
    
    private lazy var emailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundColor
        button.layer.cornerRadius = 40
        button.tintColor = .titleColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "envelope"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .navigationColor
        configureDismissButton()
        configureHorizontalStackView()
        configureVerticalStackView()
    }
    
    private func configureDismissButton() {
        view.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            dismissButton.widthAnchor.constraint(equalToConstant: 44),
            dismissButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureHorizontalStackView() {
        horizontalStackView.addArrangedSubview(phoneButton)
        horizontalStackView.addArrangedSubview(emailButton)
        
        NSLayoutConstraint.activate([
            phoneButton.widthAnchor.constraint(equalToConstant: 80),
            phoneButton.heightAnchor.constraint(equalToConstant: 80),
            emailButton.widthAnchor.constraint(equalToConstant: 80),
            emailButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configureVerticalStackView() {
        verticalStackView.addArrangedSubview(usernameLabel)
        verticalStackView.addArrangedSubview(infomationLabel)
        verticalStackView.addArrangedSubview(profileImageView)
        verticalStackView.addArrangedSubview(phoneNumberLabel)
        verticalStackView.addArrangedSubview(emailAddressLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        view.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
