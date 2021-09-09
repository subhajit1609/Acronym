//
//  AcronymAPIHandlerMock.swift
//  AcronymApplication
//


import Foundation
class AcronymAPIHandlerMock: AcronymAPIHandlerProtocol {
    private let fetchAcronymSearchAPIResult: AcronymAPIMockResult
    init(fetchAcronymSearchAPIResult: AcronymAPIMockResult = .successWithValue) {
        self.fetchAcronymSearchAPIResult = fetchAcronymSearchAPIResult
    } 
    func getAcronymList(paramater: AcronymSearchParamater, _ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void)) {
        let longFormModel = AcronymModel(longForm: "Federal Bureau of Investigation")
        let model = AcronymsUsablesModel(shortForm: "FBI", longformList: [longFormModel])
        switch fetchAcronymSearchAPIResult {
        case .successWithValue:
            completion(.success([model]))
        case .failureWithError:
            completion(.failure(AcronymApplicationError.invalidResponse))
        }
    }
}
