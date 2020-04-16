//
//  ChangesView.swift
//  iOSArchitecturesDemo
//
//  Created by Григорий Мартюшин on 09.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class ChangesView: UIView {
    // Заголовок блока
    private(set) lazy var appVersionHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Что нового"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textColor = .lightGray
        
        return label
    }()
    
    // Номер версии
    private(set) lazy var appVersionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .white
        return label
    }()

    // Описание изменений
    private(set) lazy var appVersionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.numberOfLines = 20
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupLayout()
    }
    
    private func setupLayout(){
        self.addSubview(self.appVersionHeaderLabel)
        self.addSubview(self.appVersionLabel)
        self.addSubview(self.appVersionTextLabel)
        
        NSLayoutConstraint.activate([
            self.appVersionHeaderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            self.appVersionHeaderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.appVersionHeaderLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
            self.appVersionHeaderLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            self.appVersionLabel.topAnchor.constraint(equalTo: self.appVersionHeaderLabel.bottomAnchor, constant: 12.0),
            self.appVersionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.appVersionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),

            self.appVersionTextLabel.topAnchor.constraint(equalTo: self.appVersionLabel.bottomAnchor, constant: 5.0),
            self.appVersionTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.appVersionTextLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
            self.appVersionTextLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.appVersionTextLabel.heightAnchor.constraint(equalToConstant: 120),
            self.appVersionTextLabel.widthAnchor.constraint(equalToConstant: 250)
            
        ])
    }
}
