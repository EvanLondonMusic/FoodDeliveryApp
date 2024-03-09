//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Evan London on 25.02.2024.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    
    // MARK: - Properties:
    private var state: LoginViewState = .initial
    weak var viewOutput: LoginViewOutput!
    
    // MARK: - Views:
    private lazy var bottomView = FDBottomView()
    private lazy var textFiled = FDTextField()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    
    // MARK: - Initializer:
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.background
        setupLayout()
        
        bottomView.buttonTwoAction = facebookPress
        bottomView.buttonOneAction = googlePress
    }
    
    func facebookPress() {
        print("facebook")
    }
    
    func googlePress() {
        print("google")
    }

}

private extension LoginViewController {
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomView()
            setupTextField()
        case .signUp:
            setupBottomView()
            setupTextField()
        }
    }
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    func setupTextField() {
        view.addSubview(textFiled)
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFiled.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFiled.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textFiled.heightAnchor.constraint(equalToConstant: 50),
            textFiled.widthAnchor.constraint(equalToConstant: 354)
        ])
    }
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .appstore)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 109),
            logoImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign in")
        signInButton.scheme = .orange
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            signInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign in")
        signUpButton.scheme = .gray
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
}

#Preview("LoginVC") {
    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
}

