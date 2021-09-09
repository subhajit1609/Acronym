//
//  AcronymSearchRemoteManager.swift
//  AcronymApplication
//


import Foundation

/// This protocol handles Message Center api calls.
protocol AcronymSearchRemoteStoreProtocol {
    func getAcronymList(paramater: AcronymSearchParamater, _ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void))
}
class AcronymSearchRemoteStore: AcronymSearchRemoteStoreProtocol {
    private let apiHandler: AcronymAPIHandlerProtocol
    required init(apiHandler: AcronymAPIHandlerProtocol) {
        self.apiHandler = apiHandler
    }
    func getAcronymList(paramater: AcronymSearchParamater, _ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void)) {
        apiHandler.getAcronymList(paramater: paramater, completion)
    }
}
