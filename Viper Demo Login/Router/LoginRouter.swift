//
//  LoginRouter.swift
//  Viper Demo Login
//
//  Created by Neosoft on 29/09/23.
//

import UIKit

//MARK: - LoginRouter
class LoginRouter: NSObject, LoginRouterProtocol {
    
    static func createModule() -> UIViewController{
        
        var view = LoginViewController(nibName: ViewControllerName.Login.rawValue, bundle: nil)
        
        var presenter:LoginPresenterProtocol = LoginPresenter()
        var router:LoginRouterProtocol = LoginRouter()
        var interactor:LoginInteractorProtocol = LoginInteractor()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToNextScreen(navigationController: UINavigationController) {
        
    }
}
