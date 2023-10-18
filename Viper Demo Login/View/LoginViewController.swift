//
//  LoginViewController.swift
//  Viper Demo Login
//
//  Created by Neosoft on 29/09/23.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblForgotPassword: UILabel!
    @IBOutlet weak var lblDontHaveAccount: UILabel!
    @IBOutlet var txtContainerViews: [UITextField]!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnAddUserTapped: UIButton!
    @IBOutlet weak var backImg: UIImageView!
    
    var presenter: LoginPresenterProtocol?
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setUpUI()
    }
    
    private func setDelegates(){
        tfUsername.delegate = self
        tfPassword.delegate = self
    }
    
    //MARK: - SetUpUI
    private func setUpUI(){
        
        navigationController?.navigationBar.isHidden = true
        
        //TextFields Views
        for (index,txtv) in txtContainerViews.enumerated(){
            txtv.layer.borderWidth = 1.0
            txtv.layer.borderColor = UIColor.white.cgColor
            txtv.setPlaceholder(presenter?.getTextFieldData(index1: index, index2: 0) ?? "")
            if let image = UIImage(systemName: (presenter?.getTextFieldData(index1: index, index2: 1) ?? "person")) {
                             txtv.setIcon(image)
                             txtv.tintColor = .white
            }
        }
        
        //Buttons
        btnLogin.layer.cornerRadius = 5.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(forgotPassTapped))
        lblForgotPassword.addGestureRecognizer(tap)
        lblForgotPassword.isUserInteractionEnabled = true
        
        let backImgTap = UITapGestureRecognizer(target: self, action:#selector(forgotPassTapped) )
        backImg.addGestureRecognizer(backImgTap)
        backImg.isUserInteractionEnabled = true
    }
    
    //MARK: - Send Validations
    private func sendValidations(){
        presenter?.sendValidations(email: tfUsername.text ?? "", pass: tfPassword.text ?? "")
    }
    
    private func callForgotPass(){
    }
    
    //Change UI to/from forgot and login screen
    private func changeUI(){
        tfPassword.text = ""
        tfUsername.text = ""
        if lblForgotPassword.isHidden == false{
            tfPassword.isHidden = true
            lblForgotPassword.isHidden = true
            backImg.isHidden = false
            btnLogin.setTitle(ScreenText.Login.submitButton.rawValue, for:.normal)
        } else {
            lblForgotPassword.isHidden = false
            tfPassword.isHidden = false
            backImg.isHidden = true
            btnLogin.setTitle(ScreenText.Login.loginButton.rawValue, for:.normal)
        }
    }
    
    func showAlert(result: Bool, msg: String) {
        DispatchQueue.main.async {
            if self.btnLogin.titleLabel?.text == ScreenText.Login.submitButton.rawValue{
                self.showSingleButtonAlert(title: AlertText.Title.alert.rawValue, msg: msg) {
                    self.changeUI()
                }
            } else {
                if result{
                    self.showSingleButtonAlert(title: AlertText.Title.alert.rawValue, msg: msg, okClosure: nil)
                } else {
                    self.showSingleButtonAlert(title: AlertText.Title.alert.rawValue, msg: msg, okClosure: nil)
                }
            }
        }
    }
    
    //MARK: - @objc
    @objc func forgotPassTapped(){
        changeUI()
    }
    
    //MARK: - IBActions
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        if btnLogin.titleLabel?.text == ScreenText.Login.submitButton.rawValue{
            callForgotPass()
        } else {
            sendValidations()
        }
    }
    
    @IBAction func btnAddUserTapped(_ sender: UIButton) {
        if lblForgotPassword.isHidden == true{
            changeUI()
        }
    }
}

//MARK: - TextField Delegate
extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case tfUsername:
            textField.resignFirstResponder()
            tfPassword.becomeFirstResponder()
        case tfPassword:
            textField.resignFirstResponder()
        default:
            return false
        }
        return true
    }
}
