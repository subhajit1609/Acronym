//
//  AcronymSearchRepositoryContainerFactory.swift
//  AcronymApplication
//


import Foundation

/**
 This structure is to be used to prepare repo container and it's dependencies
 */

struct AcronymSearchRepositoryContainerFactory {
    func makeRepositoryContainerFactory() -> AcronymSearchRepositoryContainerProtocol {
        AcronymSearchRepositoryContainer(acronymSearchRepository: AcronymSearchRepositoryFactory().makeMessageCenterRepository())
        
    }
}
