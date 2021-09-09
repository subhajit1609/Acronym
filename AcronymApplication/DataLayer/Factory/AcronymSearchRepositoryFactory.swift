//
//  AcronymSearchRepositoryFactory.swift
//  AcronymApplication
//


import Foundation


class AcronymSearchRepositoryFactory {
    public func makeMessageCenterRepository() -> AcronymSearchRepository {
        return AcronymSearchRepository(acronymSearchRemote: makeRemoteDataSource())
    }
    public func makeRemoteDataSource() -> AcronymSearchRemoteStore? {
        return AcronymSearchRemoteStore(apiHandler: makeOrderAPIHandler())
    }
    public func makeOrderAPIHandler() -> AcronymAPIHandler {
        return AcronymAPIHandler(remoteMapper: AcronymSearchRemoteDataMapper())
    }
}
