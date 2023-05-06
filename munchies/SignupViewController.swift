//
//  SignupViewController.swift
//  munchies
//
//  Created by Janet Olowe on 5/6/23.
//

import UIKit

class SignupViewController: UIViewController {

    let header = UIImageView()
    let footer = UIImageView()
    let infoLabel = UILabel()
    let emailLabel = UILabel()
    let emailField = UITextField()
    let usernameLabel = UILabel()
    let usernameField = UITextField()
    let passwordLabel = UILabel()
    let passwordField = UITextField()
    let signupButton = UIButton()
    let backButton = UIButton()

    let failLabel = UILabel()
    
    var users: [User]
    
//    weak var delegate: SignupDelegate?

    init(users: [User]) {
        self.users = users
//        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 240/255, green: 137/255, blue: 128/255, alpha: 1)
        navigationItem.hidesBackButton = true

        
        // Remove UINavBar background color
        let app = UINavigationBarAppearance()
        app.configureWithTransparentBackground()
        self.navigationController?.navigationBar.standardAppearance = app
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        self.navigationController?.navigationBar.compactAppearance = app

        // Do any additional setup after loading the view.
        header.image = UIImage(named: "header1")
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .clear
        view.addSubview(header)
        
        footer.image = UIImage(named: "footer")
        footer.backgroundColor = .clear
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        infoLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        infoLabel.font = UIFont(name: "Lato-Bold", size: 32)
        infoLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.textAlignment = .center
        infoLabel.text = "Create an Account"
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)
        
        
        emailLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        emailLabel.font = UIFont(name: "Lato-Bold", size: 22)
        emailLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        emailLabel.text = "Email"
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: emailField.frame.height))
        emailField.leftView = paddingView1
        emailField.leftViewMode = .always
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        emailField.font = UIFont(name: "Lato-Bold", size: 22)
        emailField.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        emailField.layer.backgroundColor = UIColor(red: 0.753, green: 0.11, blue: 0.176, alpha: 0.26).cgColor
        emailField.layer.cornerRadius = 22.2
        emailField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailField)
        
        usernameLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        usernameLabel.font = UIFont(name: "Lato-Bold", size: 22)
        usernameLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        usernameLabel.text = "Username"
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: usernameField.frame.height))
        usernameField.leftView = paddingView2
        usernameField.leftViewMode = .always
        usernameField.autocapitalizationType = .none
        usernameField.autocorrectionType = .no
        usernameField.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        usernameField.font = UIFont(name: "Lato-Bold", size: 22)
        usernameField.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        usernameField.layer.backgroundColor = UIColor(red: 0.753, green: 0.11, blue: 0.176, alpha: 0.26).cgColor
        usernameField.layer.cornerRadius = 22.2
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameField)
        
        passwordLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        passwordLabel.font = UIFont(name: "Lato-Bold", size: 22)
        passwordLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        passwordLabel.text = "Password"
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: passwordField.frame.height))
        passwordField.leftView = paddingView3
        passwordField.leftViewMode = .always
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.isSecureTextEntry = true
        passwordField.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        passwordField.font = UIFont(name: "Lato-Bold", size: 22)
        passwordField.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        passwordField.layer.backgroundColor = UIColor(red: 0.753, green: 0.11, blue: 0.176, alpha: 0.26).cgColor
        passwordField.layer.cornerRadius = 22.2
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordField)
        
        signupButton.setImage(UIImage(named: "signup-button"), for: .normal)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signupButton)
        
        failLabel.isHidden = true
        failLabel.textColor = .red
        failLabel.font = UIFont(name: "Lato-Bold", size: 22)
        failLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        failLabel.text = "signup Failed"
        failLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(failLabel)
        
        backButton.setTitle("< Back", for: .normal)
        backButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        backButton.backgroundColor = .clear
        backButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        

        
        setupConstraints()

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 348),
            infoLabel.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38)
        ])
    
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 6),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 318),
            emailField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38)
        ])
    
        NSLayoutConstraint.activate([
            usernameField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 6),
            usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameField.widthAnchor.constraint(equalToConstant: 318),
            usernameField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38)
        ])
    
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 318),
            passwordField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 12),
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.widthAnchor.constraint(equalToConstant: 302),
            signupButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            failLabel.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 3),
            failLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
    }
    
    @objc func signupButtonTapped() {
            
        let username = usernameField.text!
        let password = passwordField.text!
        let email = emailField.text!
        
        let newUser = User(username: username, password: password, email: email)
        users.append(newUser)
        
        NetworkManager.shared.createUser(email: email, password: password, username: username) { response in
        }
        
        let loginVC = LoginViewController(users: self.users)
            navigationController?.pushViewController(loginVC, animated: true)
        }
    
    @objc func backButtonTapped() {
        if let loginVC = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) {
            navigationController?.popToViewController(loginVC, animated: true)
        }
    }
}


//protocol SignupDelegate: UIViewController {
//    func signup(email: String, password: String, username: String)
//}
