//
//  LoginProtocols.swift
//  Viper Demo Login
//
//  Created by Neosoft on 29/09/23.
//

import UIKit

protocol ShowResult{
    func showAlert(result:Bool,msg:String)
}

protocol TransferData{
    func getTextFieldData(index1: Int,index2: Int) -> String
    func sendValidations(email: String, pass: String)
}

protocol LoginRouterProtocol{
    static func createModule() -> UIViewController
    func pushToNextScreen(navigationController:UINavigationController)
}

protocol LoginPresenterProtocol: TransferData,ShowResult{
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var router : LoginRouterProtocol? { get set }
}

protocol LoginInteractorProtocol:TransferData{
    var presenter: LoginPresenterProtocol? { get set }
}

protocol LoginViewProtocol:ShowResult{
    var presenter: LoginPresenterProtocol? {get set}
}

