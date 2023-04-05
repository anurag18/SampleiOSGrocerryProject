//
//  ApiServiceProtocol.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 29/03/23.
//

import Foundation

protocol ApiServiceProtocol {
    var baseURL: String { get }
    var endPoint: APIEndPoint { get }
    func makeApiRequest(completion:@escaping (AppNetworkResponse?, AppError?) -> Void)
}
