//
//  NetworkManager.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 26/03/23.
//

import Foundation

struct AppNetworkResponse {
    let response: [String: Any]
    let error: AppError?
}

class ManagedSession {
    let session: URLSessionProtocol
    
    init(sessionType: URLSessionType, endPoint: APIEndPoint? = nil) {
        self.session = URLSessionFactory.createManageSession(sessionType: sessionType, endPoint: endPoint)
    }
    
    func initiateNetworkRequest(with url: URL, onRequestCompletion: @escaping (AppNetworkResponse?, AppError?) -> Void) {
        let dataTask = self.session.dataTask(with: url) { data, response, error in
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                print("status code is nil")
                return
            }
            guard let jsonDataResponse = data else {
                onRequestCompletion(nil, AppError.NoResponse)
                return
            }
            
            switch statusCode {
            case 200:
                do {
                    if let dictionary = try JSONSerialization.jsonObject(with: jsonDataResponse, options: []) as? [String: Any], let responseForChildApi = dictionary["data"] as? [String: Any] {
                        let response = AppNetworkResponse(response: responseForChildApi, error: nil)
                        onRequestCompletion(response, nil)
                    } else {
                        onRequestCompletion(nil, AppError.OtherFormatResponseReceived)
                    }
                } catch {
                    onRequestCompletion(nil, AppError.UnableToParseJson)
                }
                
                break
            case 401:
                onRequestCompletion(nil, AppError.BadReponse)
                break
            default:
                onRequestCompletion(nil, AppError.UnknownError)
                break
            }
        }
        dataTask.resume()
    }
}
