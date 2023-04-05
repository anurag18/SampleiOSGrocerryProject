//
//  SessionManagerProtocol.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 30/03/23.
//

import Foundation

protocol SessionManagerProtocol {
    var endPoint: APIEndPoint? { get }
    var activatedSession: ManagedSession { get }
}

extension SessionManagerProtocol {
    var activatedSession: ManagedSession {
#if STUBBED
        return ManagedSession(sessionType: .mock, endPoint: self.endPoint)
#else
        return ManagedSession(sessionType: .real)
#endif
    }
}
