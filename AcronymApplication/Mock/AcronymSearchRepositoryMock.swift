//
//  AcronymSearchRepositoryMock.swift
//  AcronymApplication
//


import Foundation
class AcronymSearchRepositoryMock: AcronymSearchRepositorySource {
    private let fetchAcronymSearchRepositoryResult: RepositoryMockResult
    init(fetchAcronymSearchRepositoryResult: RepositoryMockResult = .successWithValue) {
        self.fetchAcronymSearchRepositoryResult = fetchAcronymSearchRepositoryResult
    }
    func fetchAcronymList(searchStr: String, _ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void)) {
        let longFormModel = AcronymModel(longForm: "Federal Bureau of Investigation")
        let model = AcronymsUsablesModel(shortForm: "FBI", longformList: [longFormModel])
        switch fetchAcronymSearchRepositoryResult {
        case .successWithValue:
            completion(.success([model]))
        case .failureWithError:
            completion(.failure(AcronymApplicationError.invalidResponse))
        }
    }
    
    
}
