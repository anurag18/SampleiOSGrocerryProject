//
//  URLSessionFactory.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 31/03/23.
//

import Foundation

struct URLSessionFactory {
    
    static func createManageSession(sessionType: URLSessionType, endPoint: APIEndPoint? = nil ) -> URLSessionProtocol {
        var session: URLSessionProtocol
        
        switch sessionType {
        case .mock:
            let mockSession = MockURLSession(endPoint: endPoint, completionHandler: (nil, nil, AppError.BadReponse))
            session = mockSession
        case .real:
            session = URLSession.shared
        }
         
        return session
    }
}
