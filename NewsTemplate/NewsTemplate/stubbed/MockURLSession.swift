//
//  MockURLSessionDataTask.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 26/03/23.
//

import Foundation


class MockURLSession: URLSessionProtocol {
    let endPoint: APIEndPoint?
    let dataTask: MockURLSessionDataTask = MockURLSessionDataTask()
    var completionHandler: (Data?, URLResponse?, Error?)
    
    init(endPoint:APIEndPoint? = nil,completionHandler: (Data?, URLResponse?, Error?)) {
        self.completionHandler = completionHandler
        self.endPoint = endPoint
    }
        
    func dataTask(with url: URL, completionHandler: (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        
        if let endPoint = self.endPoint, let data = StubbedData(endPoint: endPoint).data() {
            let response = HTTPURLResponse(url: URL(string: "\(url)")!, statusCode: 200, httpVersion: nil, headerFields: nil)
            completionHandler(data, response, nil)
        } else {
            let response = HTTPURLResponse(url: URL(string: "\(url)")!, statusCode: 202, httpVersion: nil, headerFields: nil)
            completionHandler(nil, response, AppError.FileNotFound)
        }        
        return dataTask
    }
    
}

