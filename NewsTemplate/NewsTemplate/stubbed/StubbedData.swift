//
//  StubbedData.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 27/03/23.
//

import Foundation

class StubbedData {
    private let endPoint: APIEndPoint
    init(endPoint: APIEndPoint) {
        self.endPoint = endPoint
    }
    
    private func loadJsonData(jsonFilePath: String) -> Data? {
        if let bundlePath = Bundle.main.path(forResource: "json", ofType: "bundle"),
           let bundle = Bundle(path: bundlePath),
           let jsonFilePath = bundle.path(forResource: jsonFilePath, ofType: "json")
        {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
    
    func data() -> Data? { self.loadJsonData(jsonFilePath: self.endPoint.path) }
}
