//
//  Response.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 16/03/23.
//

import Foundation

struct ResponseParser {
    static func parse<T: Codable>(dictionary: [String: Any]) -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            let parsedResponse: T = try JSONDecoder().decode(T.self, from: jsonData) as T
            return parsedResponse
        } catch {
            print(error)
        }
        return nil
    }
}
