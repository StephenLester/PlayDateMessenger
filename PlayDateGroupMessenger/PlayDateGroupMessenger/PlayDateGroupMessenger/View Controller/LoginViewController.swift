//
//  LogninViewController.swift
//  PlayDateGroupMessenger
//
//  Created by Steve Lester on 2/5/18.
//  Copyright © 2018 Steve Lester. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var messagesController: MessagesTableViewController?
    var bottomTextViewConstraint: NSLayoutConstraint!
    var buttonOn: Bool = false
    
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

    
     var eulaButton: UIButton =  {
        let eulaButton = UIButton(type: .system)
        eulaButton.setTitle("By Signing up you're agreeing to our Privacy Policy and Terms of Service.", for: .normal)
        eulaButton.titleLabel?.numberOfLines = 2
        eulaButton.bounds = CGRect(x: 0, y: 0, width: 200, height: 50)
        eulaButton.titleLabel?.textAlignment = NSTextAlignment.center
        eulaButton.backgroundColor = UIColor.clear
        eulaButton.setTitleColor(UIColor.darkText, for: .normal)
        eulaButton.layer.cornerRadius = 10
        eulaButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        eulaButton.translatesAutoresizingMaskIntoConstraints = false
        
        eulaButton.addTarget(self, action: #selector(handleEulaForm), for: .touchUpInside)
        
        return eulaButton
    }()
    
    @objc func handleEulaForm() {
        // FIXME: - push or animate UIVIEW
        
        
        if buttonOn {
            hideTextView()
        } else {
            showTextView()
        }
        buttonOn = !buttonOn
    }
    
   
    
    func showTextView() {
        UIView.animate(withDuration: 0.5) {
            self.animateButtonView.isHidden = false
            self.animateButtonView.alpha = 1
//            self.bottomTextViewConstraint.constant = -100
            self.view.layoutIfNeeded()
        }
    }
    
    func hideTextView() {
        UIView.animate(withDuration: 0.5) {
            self.animateButtonView.isHidden = true
            self.animateButtonView.alpha = 0
//            self.bottomTextViewConstraint.constant = 100
            self.view.layoutIfNeeded()
        }
    }
    
    var animateButtonView: UITextView = {
        let animateTextView = UITextView(frame: CGRect(x: 0, y: 0, width: 250.0, height: 100.0))
        animateTextView.translatesAutoresizingMaskIntoConstraints = false
        animateTextView.text = "PLAYDATE GROUP MESSENGER APP END USER LICENSE AGREEMENT. This End User License Agreement (“Agreement”) is between you and PlayDate Group Messenger and governs use of this app made available through the Apple App Store. By installing the PlayDate Group Messenger App, you agree to be bound by this Agreement and understand that there is no tolerance for objectionable content. If you do not agree with the terms and conditions of this Agreement, you are not entitled to use the PlayDate Group Messenger App.In order to ensure PlayDate Group Messenger provides the best experience possible for everyone, we strongly enforce a no tolerance policy for objectionable content. If you see inappropriate content, please use the Report as offensive feature found under each post.1. Parties This Agreement is between you and PlayDate Group Messenger only, and not Apple, Inc. (“Apple”). Notwithstanding the foregoing, you acknowledge that Apple and its subsidiaries are third party beneficiaries of this Agreement and Apple has the right to enforce this Agreement against you. PlayDate Group Messenger, not Apple, is solely responsible for the PlayDate Group Messenger App and its content. 2. Privacy PlayDate Group Messenger may collect and use information about your usage of the PlayDate Group Messenger App, including certain types of information from and about your device. PlayDate Group Messenger may use this information, as long as it is in a form that does not personally identify you, to measure the use and performance of the PlayDate Group Messenger App. 3. Limited License PlayDate Group Messenger grants you a limited, non-exclusive, non-transferable, revocable license to use the PlayDate Group Messenger App for your personal, non-commercial purposes. You may only use the PlayDate Group Messenger App on Apple devices that you own or control and as permitted by the App Store Terms of Service. 4. Age Restrictions By using the PlayDate Group Messenger App, you represent and warrant that (a) you are 17 years of age or older and you agree to be bound by this Agreement; (b) if you are under 17 years of age, you have obtained verifiable consent from a parent or legal guardian; and (c) your use of the PlayDate Group Messenger App does not violate any applicable law or regulation. Your access tothe PlayDate Group Messenger App may be terminated without warning if PlayDate Group Messenger believes, in its sole discretion, that you are under the age of 17 years and have not obtained verifiable consent from a parent or legal guardian. If you are a parent or legal guardian and you provide your consent to your child'suse of the PlayDate Group Messenger App, you agree to be bound by this Agreement in respect to your child's use of the PlayDate Group Messenger App. 5. Objectionable Content Policy Content may not be submitted to PlayDate Group Messenger, who will moderate all content and ultimately decide whether or not to post a submission to the extent such content includes, is in conjunction with, or alongside any, Objectionable Content. Objectionable Content includes, but is not limited to: (i) sexually explicit materials; (ii) obscene, defamatory, libelous, slanderous, violent and/or unlawful content or profanity; (iii) content that infringes upon the rights of any third party, including copyright, trademark, privacy, publicity or other personal or proprietary right, or that is deceptive or fraudulent; (iv) content that promotes the use or sale of illegal or regulated substances, tobacco products, ammunition and/or firearms; and (v) gambling, including without limitation, any online casino, sports books, bingo or poker. 6. Warranty PlayDate Group Messenger disclaims all warranties about the PlayDate Group Messenger App to the fullest extent permitted by law. To the extent any warranty exists under law that cannot be disclaimed, PlayDate Group Messenger, not Apple, shall be solely responsible for such warranty. 7. Maintenance and Support PlayDate Group Messenger does provide minimal maintenance or support for it but not to the extent that any maintenance or support is required by applicable law, PlayDate Group Messenger, not Apple, shall be obligated to furnish any such maintenance or support. 8. Product Claims PlayDate Group Messenger, not Apple, is responsible for addressing any claims by you relating to the PlayDate Group Messenger App or use of it, including, but not limited to: (i) any product liability claim; (ii) any claim that the PlayDate Group Messenger App fails to conform to any applicable legal or regulatory requirement; and (iii) any claim arising under consumer protection or similar legislation. Nothing in this Agreement shall be deemed an admission that you may have such claims. 9. Third Party Intellectual Property Claims PlayDate Group Messenger shall not be obligated to indemnify or defend you with respect to any third party claim arising out or relating to the PlayDate Group Messenger App. To the extent PlayDate Group Messenger is required to provide indemnification by applicable law, PlayDate Group Messenger, not Apple, shall be solely responsible for the investigation, defense, settlement and discharge of any claim that the PlayDate Group Messenger App or your use of it infringes any third party intellectual property right."
        animateTextView.font = UIFont.systemFont(ofSize: 14)
        animateTextView.textAlignment = NSTextAlignment.center
//        animateTextView.backgroundColor = UIColor(r: 1/50, g: 1/150, b: 1/500)
        animateTextView.textColor = .black
        animateTextView.isEditable = false
        return animateTextView
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
        logoImageView.alpha = 1
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
    
   lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleToFill
//        imageView.layer.cornerRadius = imageView.frame.size.width/2
//        imageView.clipsToBounds = true
//        imageView.alpha = 1
    
    imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
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
    
        animateButtonView.isHidden = true
        
        view.addSubview(appLogo)
        view.addSubview(imputContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(eulaButton)
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(animateButtonView)

    
        setupAppLogo()
        setupImputsContainerView()
        setupLoginRegisterButton()
        setupProfileImageView()
        setupEulaButtonView()
        setupLoginRegisterSegmentedControl()
        hideKeyboardWhenTappedAround()
        setupAnimatedView()
 
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
        NSLayoutConstraint.activate([
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: imputContainerView.topAnchor, constant: -12),
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor, multiplier: 0.7),
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36),
    ])
    }
    
    func setupAppLogo() {
        // App logo constraints
//        appLogo.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor, constant: -110).isActive = true
//        appLogo.centerYAnchor.constraint(equalTo: profileImageView.topAnchor, constant: -75).isActive = true
        NSLayoutConstraint.activate([
        appLogo.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor, constant: -75),
        appLogo.bottomAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 10),
        appLogo.widthAnchor.constraint(equalToConstant: 160),
        appLogo.heightAnchor.constraint(equalToConstant: 140),
    ])
    }
    
    func  setupProfileImageView() {
        // Profile constraints
        NSLayoutConstraint.activate([
        profileImageView.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor),
        profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -15),
        profileImageView.widthAnchor.constraint(equalToConstant: 120),
        profileImageView.heightAnchor.constraint(equalToConstant: 120),
//            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -15),
//            profileImageView.widthAnchor.constraint(equalTo: view..widthAnchor.constraint(equalTo: imputContainerView.widthAnchor, multiplier: 0.7), constant: 10)
        ])
        
    }
    
    var inputContainerViewHightAnchor: NSLayoutConstraint?
    var nameTextFieldHightAnchor: NSLayoutConstraint?
    var emailTextFieldHightAnchor: NSLayoutConstraint?
    var passwordTextFieldHightAnchor: NSLayoutConstraint?
    var animateButtonViewHightAnchor: NSLayoutConstraint?
    
    func setupImputsContainerView() {
        // Container constraints
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
    
    func setupEulaButtonView() {
        // constraints
        eulaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        eulaButton.topAnchor.constraint(equalTo: imputContainerView.bottomAnchor, constant: 12).isActive = true
        eulaButton.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        eulaButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupLoginRegisterButton() {
        // constraints
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: eulaButton.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: imputContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
//    imputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    imputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
//    imputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//    inputContainerViewHightAnchor = imputContainerView.heightAnchor.constraint(equalToConstant: 150)
//    inputContainerViewHightAnchor?.isActive = true
    
    
    func setupAnimatedView() {
        
        animateButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animateButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        animateButtonView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -12).isActive = true
        animateButtonViewHightAnchor = animateButtonView.heightAnchor.constraint(equalToConstant: 425)
        animateButtonViewHightAnchor?.isActive = true
            

        
    }
    
 
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.nameTextField.resignFirstResponder()
//        self.emailTextField.resignFirstResponder()
//        self.passwordTextField.resignFirstResponder()
//        self.view.endEditing(true)
//        return true
//    }

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

extension UIViewController {
    func presentAlertControllerWithOkayAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

