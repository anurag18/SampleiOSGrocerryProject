//
//  GrocerryError.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 31/03/23.
//

import Foundation

enum AppError: Error {
    case BadReponse
    case NoResponse
    case UnknownError
    case FileNotFound
    case UnableToParseJson
    case OtherFormatResponseReceived
}
