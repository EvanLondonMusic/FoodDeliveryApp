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
    var viewOutput: LoginViewOutput!
    
    // MARK: - Views:
    private lazy var bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpreEnterPassword = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    
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

// MARK: - Layout
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
            setupStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        case .signUp:
            setupBottomView()
            setupStack()
            setupSignUpUsername()
            setupSignUpPassword()
            setupSignUpreEnterPassword()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            
        }
    }
    
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        
        switch state {
            
       
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -262)
            ])
            
        case .signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpreEnterPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227)
            ])
        }
        
        
    }
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.buttonTwoAction = facebookPress
        bottomView.buttonOneAction = googlePress
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            signInPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func setupSignInUsername() {
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        signInUsername.placeholder = "Username"
        
        NSLayoutConstraint.activate([
            signInUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50),
            signInUsername.widthAnchor.constraint(equalToConstant: 354)
        ])
    }
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        
        
        switch state {
        case .initial: break
        case .signIn:
            titleLabel.text = "Sign In"
        case .signUp:
            titleLabel.text = "Sign Up"
        }
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 354)
        ])
        
    }
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .loginLogo)
        logoImage.layer.cornerRadius = 24
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 109),
            logoImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In")
        signInButton.scheme = .orange
        signInButton.action = onSignInTapped
        
        switch state {
        case .initial:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
            
        case .signIn:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign in")
        signUpButton.scheme = .gray
        signUpButton.action = onSignUpTapped
        
        switch state {
        case .initial:
            signUpButton.setTitle("Sign Up")
            
            NSLayoutConstraint.activate([
                signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
                signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
                signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            NSLayoutConstraint.activate([
                signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
                signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
                signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signUpButton.topAnchor.constraint(equalTo: signUpreEnterPassword.bottomAnchor, constant: 20),
                signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
                signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        
    }
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.textColor = AppColors.fontGray
        forgotLabel.font = .Roboto.light.size(of: 14)
        forgotLabel.text = "Forgot Password?"
        forgotLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ])
    }
    
    func setupSignUpPassword() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter password"
        
        NSLayoutConstraint.activate([
//            signUpPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signUpPassword.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            signUpPassword.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpreEnterPassword() {
        signUpreEnterPassword.translatesAutoresizingMaskIntoConstraints = false
        
        signUpreEnterPassword.placeholder = "Re-enter password"
        
        NSLayoutConstraint.activate([
            signUpreEnterPassword.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            signUpreEnterPassword.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            signUpreEnterPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpUsername() {
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        
        signUpUsername.placeholder = "Enter Username"
        
        NSLayoutConstraint.activate([

            signUpUsername.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            signUpUsername.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

// MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
}

//#Preview("LoginVC") {
//    LoginViewController(viewOutput: LoginPresenter(), state: .signUp)
//}

