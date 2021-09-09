//
//  AcronymSearchRemoteDatastoreMock.swift
//  AcronymApplication
//


import Foundation
class AcronymSearchRemoteDatastoreMock: AcronymSearchRemoteStoreProtocol {
    private let fetchAcronymSearchRemoteResult: RemoteDatasourceMockResult
    init(fetchAcronymSearchRemoteResult: RemoteDatasourceMockResult = .successWithValue) {
        self.fetchAcronymSearchRemoteResult = fetchAcronymSearchRemoteResult
    } 
    func getAcronymList(paramater: AcronymSearchParamater, _ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void)) {
        let longFormModel = AcronymModel(longForm: "Federal Bureau of Investigation")
        let model = AcronymsUsablesModel(shortForm: "FBI", longformList: [longFormModel])
        switch fetchAcronymSearchRemoteResult {
        case .successWithValue:
            completion(.success([model]))
        case .failureWithError:
            completion(.failure(AcronymApplicationError.invalidResponse))
        }
    }
    
}
