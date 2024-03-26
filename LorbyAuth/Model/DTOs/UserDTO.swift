//
//  UserDTO.swift
//  LorbyAuth
//
//  Created by anjella on 17/3/24.
//

import UIKit
import Alamofire

//struct UserDTO: Codable {
//    var username: String?
//    var email: String?
//    var password: String?
//    var confirm_password: String?
//    
////    enum CodingKeys: String, CodingKey {
////        case username, email, password
////        case confirmPassword = "confirm_password"
////    }
//}




struct UserDTO: Encodable {
    let login: String
    let email: String?
    let password: String
    let passwordConfirm: String
}



//extension UserDTO {
//    var dictionary: Parameters {
//        var params: Parameters = [:]
//        if let username = self.username {
//            params["username"] = username
//        }
//        if let email = self.email {
//            params["email"] = email
//        }
//        if let password = self.password {
//            params["password"] = password
//        }
//        if let confirmPassword = self.confirmPassword {
//            params["confirm_password"] = confirmPassword
//        }
//        return params
//    }
//}
//
