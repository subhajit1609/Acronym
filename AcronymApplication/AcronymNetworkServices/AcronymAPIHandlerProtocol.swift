//
//  AcronymAPIHandlerProtocol.swift
//  AcronymApplication
//


import Foundation
/**
 This protocol contains all the methods and behaviour required to be define in AcronymAPIHandlerProtocol.
 */
protocol AcronymAPIHandlerProtocol {
    /**
     This is intialiser, to be used by the calls to initalise it's dependencies
     - Parameter session: `OEAPIRequestExecutableProtocol`, session instance
     - Parameter remoteMapper: `OERemoteMappable`, remote mapper instance
     */
    init(session: APIRequestExecuterProtocol, remoteMapper: RemoteMappable)
    
    func getAcronymList(paramater: AcronymSearchParamater, _ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void))
    
}
extension AcronymAPIHandlerProtocol {
    init(session: APIRequestExecuterProtocol = NSURLSession.shared, remoteMapper: RemoteMappable) {
        self.init(session: session, remoteMapper: remoteMapper)
    }
}

