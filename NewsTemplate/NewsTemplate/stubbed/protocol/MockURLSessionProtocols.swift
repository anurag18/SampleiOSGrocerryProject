//
//  MockURLSessionProtocols.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 31/03/23.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

struct MockURLSessionDataTask: URLSessionDataTaskProtocol {
    func resume() {
    }
}

protocol endPointForMock {
    var endPoint: APIEndPoint? { get set }
}

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler:@escaping (Data?, URLResponse?, Error?)-> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with url: URL, completionHandler:@escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return (dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTask) as URLSessionDataTaskProtocol
    }
}
