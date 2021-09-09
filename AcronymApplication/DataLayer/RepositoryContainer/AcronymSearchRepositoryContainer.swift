//
//  AcronymSearchRepositoryContainer.swift
//  AcronymApplication
//


import Foundation

protocol AcronymSearchRepositoryContainerProtocol: AnyObject {
    func getAcronymList(searchStr: String,_ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void))
}

final class AcronymSearchRepositoryContainer: AcronymSearchRepositoryContainerProtocol {
    private let acronymSearchRepository: AcronymSearchRepositorySource?
    // Initializer
    required init(acronymSearchRepository: AcronymSearchRepositorySource?) {
        self.acronymSearchRepository = acronymSearchRepository
       
    }
    func getAcronymList(searchStr: String,_ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void)) {
        acronymSearchRepository?.fetchAcronymList(searchStr: searchStr, completion)
    }
}

