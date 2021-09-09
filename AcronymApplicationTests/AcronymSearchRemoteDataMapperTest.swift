//
//  AcronymSearchRemoteDataMapperTest.swift
//  AcronymApplicationTests
//

import XCTest
@testable import AcronymApplication

class AcronymSearchRemoteDataMapperTest: XCTestCase {
    private var remoteDataMapper = AcronymSearchRemoteDataMapper()
    func test_ParsablesToUsables() {
        let longForm = LongForm(lf: "Federal Bureau of Investigation")
        let parsableModel = AcronymsParsableModel(sf: "FBI", lfs: [longForm])
        let usableModelList = remoteDataMapper.mapParsablesToUsables([parsableModel]) as? [AcronymsUsablesModel]
        XCTAssert(usableModelList?.first?.shortForm == parsableModel.sf)
        XCTAssert(usableModelList?.first?.longformList.first?.longForm == parsableModel.lfs.first?.lf)
    }
    func test_ParsableToUsable() {
        let longForm = LongForm(lf: "Federal Bureau of Investigation")
        let parsableModel = AcronymsParsableModel(sf: "FBI", lfs: [longForm])
        let usableModel = remoteDataMapper.mapParsableToUsable(parsableModel) as? AcronymsUsablesModel
        XCTAssert(usableModel?.shortForm == parsableModel.sf)
        XCTAssert(usableModel?.longformList.first?.longForm == parsableModel.lfs.first?.lf)
    }
    func test_UsableToParsable() {
        let result = remoteDataMapper.mapUsableToParsable(AcronymsUsablesModel(shortForm: "FBI"))
        XCTAssert(result == nil)
    }
    func test_UsablesToParsables() {
        let result = remoteDataMapper.mapUsablesToParsables([AcronymsUsablesModel(shortForm: "FBI")])
        XCTAssert(result == nil)
    }
}
