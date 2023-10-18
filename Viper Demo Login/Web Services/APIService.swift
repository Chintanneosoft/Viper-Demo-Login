//
//  APIServices.swift
//  NeoSTORE
//
//  Created by Neosoft1 on 23/08/23.
//

import Foundation

// MARK: - Constansts for APIService
let devRootPoint = "http://staging.php-dev.in:8844/trainingapp"
let prodRootPoint = ""

let contentValue = "application/x-www-form-urlencoded"
let contentKey = "Content-Type"

enum  NetworkEnvironment : String{
    case dev
    case prod
}

var networkEnvironment: NetworkEnvironment {
    return .dev
}
// BaseURL
var baseURL : String{
    switch networkEnvironment {
    case .dev:
        return devRootPoint
    case .prod:
        return prodRootPoint
    }
}

//MARK: - APIService
enum APIServices{
    //All Possible Requests
    case userLogin(param: [String:Any])

    // Setting url path
    var path: String{
        let apiDomain = "/api/"
        var urlPath:String = ""
        switch self{
            
        case .userLogin:
            urlPath = "users/login"
        }
            return baseURL + apiDomain + urlPath
        }
        
        
        // Setting HTTP Method
        var httpMethod: String {
            switch self {
            case .userLogin:
                return "POST"
            default:
                return "GET"
            }
        }
        
        // Param to pass in HTTPBody of URL
        var param: [String:Any]? {
            switch self {
            case .userLogin(let param):
                return param
            default:
                return nil
            }
        }
        
        // Setting Header for Request
        var header: [String:String] {
            var dict:[String:String]
            dict = [contentKey:contentValue,"access_token":UserDefaults.standard.string(forKey:"accessToken") ?? ""]
            return dict
        }
    }
    
