//
//  NetworkLayer.swift
//  LorbyAuth
//
//  Created by anjella on 17/3/24.
//

import UIKit
import Alamofire

final class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    private init() { }
    
    // MARK: - Login
    func login(userDTO: UserDTO, completion: @escaping (Result<Data?, Error>) -> Void) {
        request(apiType: .login, parameters: userDTO.dictionary, completion: completion)
    }
    
    // MARK: - Logout
    func logout(completion: @escaping (Result<Data?, Error>) -> Void) {
        request(apiType: .logout, completion: completion)
    }
    
    // MARK: - Protected
    func getProtectedData(completion: @escaping (Result<Data?, Error>) -> Void) {
        request(apiType: .protected, completion: completion)
    }
    
    // MARK: - Signup
    func signup(userDTO: UserDTO, completion: @escaping (Result<Data?, Error>) -> Void) {
        request(apiType: .signup, parameters: userDTO.dictionary, completion: completion)
    }
    
    private func request(apiType: NetworkAPI, parameters: Parameters? = nil, completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let urlRequest = apiType.url else {
            let error = NSError(domain: "YourDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        
        AF.request(urlRequest, method: apiType.method, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
