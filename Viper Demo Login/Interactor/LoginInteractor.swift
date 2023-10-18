//
//  LoginInterpretor.swift
//  Viper Demo Login
//
//  Created by Neosoft on 29/09/23.
//

import UIKit

//MARK: - LoginInteractor
class LoginInteractor: LoginInteractorProtocol {
  
    var presenter: LoginPresenterProtocol?
    let validation = Validation()
    let apiService = LoginAPIService()
    
    var txtFieldData = [[ScreenText.Login.userName.rawValue,ImageNames.user.rawValue],[ScreenText.Login.password.rawValue,ImageNames.password.rawValue]]
    
    func getTextFieldData(index1:Int,index2:Int) -> String {
        return txtFieldData[index1][index2]
    }
    
    func sendValidations(email: String, pass: String) {
        let valid = validation.loginValidation(email: email, password: pass)
        if valid == nil{
            apiService.loginUser(email: email, pass: pass){
                (response) in
                switch response{
                case .success(let value):
                    if (value.0 != nil){
                        self.presenter?.showAlert(result: true,msg: value.0!.user_msg!)
                    }
                    else{
                        self.presenter?.showAlert(result: false, msg: value.1!.user_msg!)
                    }
                case .failure(let error):
                    print(error)
                    self.presenter?.showAlert(result: false, msg: error.localizedDescription)
                }
            }
        } else {
            self.presenter?.showAlert(result: false, msg: valid ?? "")
        }
    }
}
