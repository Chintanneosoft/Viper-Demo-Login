//
//  LoginPresenter.swift
//  Viper Demo Login
//
//  Created by Neosoft on 29/09/23.
//

import UIKit

//MARK: - LoginPresenter
class LoginPresenter: LoginPresenterProtocol {
   
    var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    func getTextFieldData(index1: Int, index2: Int) -> String {
        return interactor?.getTextFieldData(index1: index1, index2: index2) ?? ""
    }
    
    func sendValidations(email: String, pass: String) {
        interactor?.sendValidations(email: email, pass: pass)
    }
    
    func showAlert(result: Bool, msg: String) {
        view?.showAlert(result: result, msg: msg)
    }
}
