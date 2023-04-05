//
//  APIEndPoint.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 29/03/23.
//

import Foundation

protocol APIEndPoint {
    var path: String { get }
    var methodType: MethodType { get }
}
