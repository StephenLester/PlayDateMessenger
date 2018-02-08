//
//  LogninViewController.swift
//  PlayDateGroupMessenger
//
//  Created by Steve Lester on 2/5/18.
//  Copyright © 2018 Steve Lester. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    var messagesController: MessagesTableViewController?
    
    let imputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 150)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
           guard let email = emailTextField.text, let password = passwordTextField.text else { print("Form is not Vaild"); return }
        

         Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
           
                if let error = error {
                    self.presentAlertControllerWithOkayAction(title: "Login Error", message: error.localizedDescription)
                    return
            }
            
            // successfully logged in our user
            
            
            self.messagesController?.fetchUserAndSetupNavBarTitle()
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    let appLogo: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleToFill
        logoImageView.layer.cornerRadius = 20
        logoImageView.layer.masksToBounds = true
        logoImageView.alpha = 0.7
        return logoImageView
    }()

    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        textField.font = UIFont.init(name: "noteworthy", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        textField.font = UIFont.init(name: "noteworthy", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        textField.font = UIFont.init(name: "noteworthy", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "profile2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        imageView.alpha = 5
        
        // original code below   NEEDS TO BE FIXED _ THE TAP NOT WORKING
//        imageView.addGestureRecognizer(UITapGestureRecognizer(target:
//          self, action: #selector(handleSelectProfileImageView)))
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: LoginViewController.self, action: #selector(handleSelectProfileImageView)))
        

        
        
        imageView.isUserInteractionEnabled = true
        
        return imageView
        
    }()
    
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Sign up"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = UIColor.white.withAlphaComponent(1)
        segmentedControl.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)

        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return segmentedControl
    }()
    
    @objc func handleLoginRegisterChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        
        // change Hight of container View
        inputContainerViewHightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        // change heightn of nameTextField
        nameTextFieldHightAnchor?.isActive = false
        nameTextFieldHightAnchor = nameTextField.heightAnchor.constraint(equalTo: imputContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHightAnchor?.isActive = true
        
        emailTextFieldHightAnchor?.isActive = false
        emailTextFieldHightAnchor = emailTextField.heightAnchor.constraint(equalTo: imputContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHightAnchor?.isActive = true
        
        passwordTextFieldHightAnchor?.isActive = false
        passwordTextFieldHightAnchor = passwordTextField.heightAnchor.constraint(equalTo: imputContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHightAnchor?.isActive = true
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        assignBackgroundImage()
        
        view.addSubview(appLogo)
        view.addSubview(imputContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(loginRegisterSegmentedControl)
        
        
        
        setupAppLogo()
        setupImputsContainerView()
        setupLoginRegisterButton()
        setupProfileImageView()
        setupLoginRegisterSegmentedControl()
        hideKeyboardWhenTappedAround()
    
        // this func below made the tap guesture happen all around the view and not just the blue default image
        //uploadProfileImage()
    
    }
    
    
    
   
    
    func assignBackgroundImage() {
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: "background1")
        backgroundImageView.alpha = 0.7
        backgroundImageView.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImageView, at: 0)
    }
    
    func setupLoginRegisterSegmentedControl() {
        // Register Constraints
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: imputContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor, multiplier: 0.7).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
    }
    
    func setupAppLogo() {
        // App logo constraints
//        appLogo.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor, constant: -110).isActive = true
//        appLogo.centerYAnchor.constraint(equalTo: profileImageView.topAnchor, constant: -75).isActive = true
        appLogo.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor, constant: -75).isActive = true
        appLogo.bottomAnchor.constraint(equalTo: profileImageView.topAnchor, constant: -10).isActive = true
        appLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        appLogo.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func  setupProfileImageView() {
        // Profile constraints
        profileImageView.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -15).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
    }
    
    var inputContainerViewHightAnchor: NSLayoutConstraint?
    var nameTextFieldHightAnchor: NSLayoutConstraint?
    var emailTextFieldHightAnchor: NSLayoutConstraint?
    var passwordTextFieldHightAnchor: NSLayoutConstraint?
    
    func setupImputsContainerView() {
        // constraints
        imputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        imputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerViewHightAnchor = imputContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputContainerViewHightAnchor?.isActive = true
        
        
        imputContainerView.addSubview(nameTextField)
        imputContainerView.addSubview(nameSeparatorView)
        imputContainerView.addSubview(emailTextField)
        imputContainerView.addSubview(emailSeparatorView)
        imputContainerView.addSubview(passwordTextField)
        
        // Name constraints
        nameTextField.leftAnchor.constraint(equalTo: imputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: imputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        nameTextFieldHightAnchor = nameTextField.heightAnchor.constraint(equalTo: imputContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHightAnchor?.isActive = true
        
        // Name constraints
        nameSeparatorView.leftAnchor.constraint(equalTo: imputContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
        // Email constraints
        emailTextField.leftAnchor.constraint(equalTo: imputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        emailTextFieldHightAnchor =  emailTextField.heightAnchor.constraint(equalTo: imputContainerView.heightAnchor, multiplier: 1/3)
       emailTextFieldHightAnchor?.isActive = true
        
        // Email constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: imputContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Password constraints
        passwordTextField.leftAnchor.constraint(equalTo: imputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        passwordTextFieldHightAnchor = passwordTextField.heightAnchor.constraint(equalTo: imputContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHightAnchor?.isActive = true
    }
    
    func setupLoginRegisterButton() {
        // constraints
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: imputContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 0.5)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
//extension UIViewController {
//    func uploadProfileImage() {
//
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleSelectProfileImageView))
////        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//}
extension UIViewController {
    func presentAlertControllerWithOkayAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

