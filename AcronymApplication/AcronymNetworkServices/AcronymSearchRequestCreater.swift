//
//  AcronymSearchRequestCreater.swift
//  AcronymApplication
//


import Foundation


public struct AcronymSearchRequestCreater: APIConfigurableProtocol {
    let params: AcronymSearchParamater
    
     init (params: AcronymSearchParamater) {
        self.params = params
    }
     var responseDataType: ResponseDataType {
        return .data
    }
    public var path: String {
        let baseurl = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=\(params.searchText)"
        return baseurl
    }
     var method: HTTPMethodsType {
        return .get
    }
   
}

