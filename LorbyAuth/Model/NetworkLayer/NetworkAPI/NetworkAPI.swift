//
//  NetworkAPI.swift
//  LorbyAuth
//
//  Created by anjella on 17/3/24.
//

import UIKit
import Alamofire

enum NetworkAPI {
    
    // MARK: - GET
    case protected
    
    // MARK: - POST
    case login
    case logout
    case signup
    
    private var scheme: String {
        return "http"
    }
    
    private var host: String {
        return "www.marina-backender.org.kg"
    }
    
    private var path: String {
        switch self {
        case .login:
            return "/login/"
        case .logout:
            return "/logout/"
        case .protected:
            return "/protected/"
        case .signup:
            return "/signup/"
        }
    }
    
    internal var method: HTTPMethod {
        switch self {
        case .login, .signup:
            return .post
        case .logout:
            return .post
        case .protected:
            return .get
        }
    }
    
    internal var parameters: Parameters? {
        switch self {
        case .login, .logout, .signup:
            return nil // !
        case .protected:
            return nil
        }
    }
    
    var url: URL? {
        guard let components = components.url else {
            return nil
        }
        return components
    }

    private var components: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        return components
    }
}

