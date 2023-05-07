//
//  LoginViewController.swift
//  munchies
//
//  Created by Janet Olowe on 5/3/23.
//

import UIKit
import CommonCrypto

class LoginViewController: UIViewController {
    
    let header = UIImageView()
    let footer = UIImageView()
    let infoLabel = UILabel()
    let emailLabel = UILabel()
    let emailField = UITextField()
    let passwordLabel = UILabel()
    let passwordField = UITextField()
    let loginButton = UIButton()
    let signupButton = UIButton()
    let failLabel = UILabel()
    let salt: String = "testing123"
    
//    var users: [User]
//
//    init(users: [User]) {
//        self.users = users
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
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
        
        infoLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        infoLabel.font = UIFont(name: "Lato-Bold", size: 32)
        infoLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.textAlignment = .center
        infoLabel.text = "Cornell’s #1\nDining Review\nApp"
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
        
        passwordLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        passwordLabel.font = UIFont(name: "Lato-Bold", size: 22)
        passwordLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        passwordLabel.text = "Password"
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: passwordField.frame.height))
        passwordField.leftView = paddingView2
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
        
        loginButton.setImage(UIImage(named: "login-button"), for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        failLabel.isHidden = true
        failLabel.textColor = .red
        failLabel.font = UIFont(name: "Lato-Bold", size: 22)
        failLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        failLabel.text = "Incorrect Username or Password"
        failLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(failLabel)
        
        footer.image = UIImage(named: "footer")
        footer.backgroundColor = .clear
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        signupButton.backgroundColor = .clear
        signupButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signupButton)
        
        setupConstraints()

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38)
        ])
    
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 6),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 318),
            emailField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38)
        ])
    
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 318),
            passwordField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 21),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 302),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            failLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 3),
            failLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            signupButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
    }
    
    @objc func signupButtonTapped() {
        let signupVC = SignupViewController()
            navigationController?.pushViewController(signupVC, animated: true)
    }
    
    func sha256(string: String) -> String? {
        guard let data = string.data(using: .utf8) else {
            return nil
        }
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        
        data.withUnsafeBytes { buffer in
            _ = CC_SHA256(buffer.baseAddress, CC_LONG(data.count), &digest)
        }
        
        let hexString = digest.map { String(format: "%02x", $0) }.joined()
        
        return hexString
    }
    
    func loginError() {
        failLabel.isHidden = false
    }
    
    @objc func loginButtonTapped() {
        
//        let username = usernameField.text!
//        let password = salt + passwordField.text! + salt
//
//        var currUser = User(username: "none", password: "none", email: "none")

//        for user in users {
//            if user.username == username {
//                currUser = user
//                break
//            }
//        }

//        if username == currUser.username && password == currUser.password {
//            usernameField.text = ""
//            passwordField.text = ""
//            failLabel.isHidden = true
//            let restaurantVC = RestaurantViewController(user: currUser)
//            navigationController?.pushViewController(restaurantVC, animated: true)
//        } else {
//            failLabel.isHidden = false
//        }
        
        
        let email = emailField.text!
        let password = sha256(string: salt + passwordField.text! + salt)

        var currUser = User(username: "none", email: "none", user_id: 0)

        
        NetworkManager.shared.login(email: email, password: password!) { response in
            DispatchQueue.main.sync {
                if (response?.username != nil) {
                    let username = response?.username
                    let user_id = response?.user_id
                    currUser = User(username: username!, email: email, user_id: user_id!)
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    self.failLabel.isHidden = true
                    let restaurantVC = RestaurantViewController(user: currUser)
                    self.navigationController?.pushViewController(restaurantVC, animated: true)
                } else {
                    self.failLabel.isHidden = false
                    return
                }
            }
        }
    }
}
