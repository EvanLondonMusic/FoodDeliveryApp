//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Evan London on 25.02.2024.
//

import UIKit

class FDBottomView: UIView {

   private let label = UILabel()
    private let viewOne = UIView()
    private let viewTwo = UIImageView()
    private let buttonOne = UIButton()
    private let buttonTwo = UIButton()
    
    var buttonOneAction: (() ->Void)?
    var buttonTwoAction: (() ->Void)?
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = AppColors.background
        setupLabel()
        setupViewOne()
        setupViewTwo()
        setupButtonOne()
        setupButtonTwo()
    }
    
    private func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.font = .Roboto.regular.size(of: 14)
        label.textColor = AppColors.fontGray
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
            
        
        ])
    }
    
    private func setupViewOne() {
        self.addSubview(viewOne)
        viewOne.backgroundColor = AppColors.lineGray
        viewOne.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewOne.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            viewOne.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewOne.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -12),
            viewOne.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    private func setupViewTwo() {
        self.addSubview(viewTwo)
        viewTwo.backgroundColor = .clear
        viewTwo.translatesAutoresizingMaskIntoConstraints = false
        viewTwo.image = UIImage(resource: .burgerLogin)
        
        NSLayoutConstraint.activate([
            viewTwo.topAnchor.constraint(equalTo: viewOne.bottomAnchor, constant: 19),
            viewTwo.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: -282/4),
            viewTwo.heightAnchor.constraint(equalToConstant: 150),
            viewTwo.widthAnchor.constraint(equalToConstant: 282)
        ])
        
    }
    
    private func setupButtonOne() {
        self.addSubview(buttonOne)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.setImage(UIImage(resource: .googlePlusLogin), for: .normal)
        buttonOne.addTarget(self, action: #selector(buttonOneTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonOne.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            buttonOne.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
    private func setupButtonTwo() {
        self.addSubview(buttonTwo)
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.setImage(UIImage(resource: .facebookLogin), for: .normal)
        buttonTwo.addTarget(self, action: #selector(buttonTwoTapped), for: .touchUpInside)
        
       
        
        NSLayoutConstraint.activate([
            buttonTwo.trailingAnchor.constraint(equalTo: buttonOne.leadingAnchor, constant: -20),
            buttonTwo.centerYAnchor.constraint(equalTo: buttonOne.centerYAnchor, constant: 0)
        ])
    }
    
}

private extension FDBottomView {
    @objc func buttonOneTapped() {
        buttonOneAction?()
    }
    
    @objc func buttonTwoTapped() {
        buttonTwoAction?()
    }
}

#Preview("BottomView", traits: .fixedLayout(width: 400, height: 150)) {
    FDBottomView()
    
}
