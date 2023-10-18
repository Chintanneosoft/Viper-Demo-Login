//
//  Constants.swift
//  Viper Demo Login
//
//  Created by Neosoft on 29/09/23.
//

import UIKit

enum ViewControllerName : String {
    case Login = "LoginViewController"
}

enum APIServiceText: String{
    case email = "email"
    case password = "password"
}

enum ScreenText{
    enum Login:String{
        case submitButton = "SUBMIT"
        case loginButton = "LOGIN"
        case userName = "Username"
        case password = "Password"
    }
}

enum ImageNames: String{
    case user = "person.fill"
    case password = "lock.fill"
    case plus = "plus"
    case person = "person"
}

enum AlertText{
    enum Title:String{
        case success = "Success"
        case error = "Error"
        case alert = "Alert"
    }
    enum Message:String{
        case emptyFields = "Fill all the Fields"
    }
}
