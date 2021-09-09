//
//  AcronymSearchRemoteDataMapper.swift
//  AcronymApplication
//


import Foundation
class AcronymSearchRemoteDataMapper: RemoteMappable {
    lazy var mapParsableToUsable: ParsableToUsable = { parsable in
        // check the type of usable
        if let item = parsable as? AcronymsParsableModel {
            return self.mapToDomain(item)
        }
        return  nil
    }
    lazy var mapParsablesToUsables: ParsablesToUsables = { parsables in
        var usables = [Usable]()
        if let items = parsables as? [AcronymsParsableModel] {
            for item in items {
                usables.append(self.mapToDomain(item))
            }
           
        }
       return usables
    }
    
    lazy var mapUsableToParsable: UsableToParsable = { _ in
        return nil
    }
    lazy var mapUsablesToParsables: UsablesToParsables = { usables in
        return nil
    }
    private func mapToDomain(_ object: AcronymsParsableModel) -> AcronymsUsablesModel {
        var longformList: [AcronymModel] = []
        let lfs = object.lfs
        for object in lfs {
            longformList.append(AcronymModel(longForm: object.lf))
        }
        return AcronymsUsablesModel(shortForm: object.sf, longformList: longformList)
    }
}
