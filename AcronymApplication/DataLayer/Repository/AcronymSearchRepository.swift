//
//  AcronymSearchRepository.swift
//  AcronymApplication
//


protocol AcronymSearchRepositorySource: AnyObject {
    func fetchAcronymList(searchStr: String,_ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void))
}

final class AcronymSearchRepository: AcronymSearchRepositorySource {
    private let acronymSearchRemote: AcronymSearchRemoteStoreProtocol?
    required init(acronymSearchRemote: AcronymSearchRemoteStoreProtocol?) {
        self.acronymSearchRemote = acronymSearchRemote

    }
    func fetchAcronymList(searchStr: String,_ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void)) {
       let params = AcronymSearchParamater(searchText: searchStr)
        acronymSearchRemote?.getAcronymList(paramater: params, completion)
    }
}

