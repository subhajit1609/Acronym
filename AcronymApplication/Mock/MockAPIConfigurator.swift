//
//  MockAPIConfigurator.swift
//  AcronymApplication
//


import Foundation
public enum MockEnum {
    case badUrl
    case bodyWithoutParameter
    case bodyWithoutValue
    case queryWithoutParameter
    case queryWithParameter
    case noHeaders
    case allValid
    case dataResponseDataType
    case dataHttpResponse
}

public struct MockAPIConfigurator: APIConfigurableProtocol {
    let mockEnum: MockEnum?
    init(mockEnum: MockEnum) {
        self.mockEnum = mockEnum
    }
    var responseDataType: ResponseDataType {
        switch self.mockEnum {
        case .dataResponseDataType?:
            return .data
        default:
            return .json
        }
    }
    var method: HTTPMethodsType {
        return .get
    }
    var parameters: URLRequestParameters {
        switch self.mockEnum {
        case .bodyWithoutParameter?:
            return .bodyParamsEncoding(bodyParams: nil)
        case .bodyWithoutValue?:
            let loginBody: [String: Any] = [:]
            return .bodyParamsEncoding(bodyParams: loginBody)
        case .queryWithoutParameter?:
            return .urlParams(urlParams: nil)
        case .queryWithParameter?:
            var loginParams: [String: Any] = [:]
            loginParams["password"] = "password"
            return .urlParams(urlParams: loginParams)
        default:
            var loginBody: [String: Any] = [:]
            loginBody["password"] = "password"
            return .bodyParamsEncoding(bodyParams: loginBody)
        }
    }
    public var headers: [String: Any]? {
        switch self.mockEnum {
        case .noHeaders?:
            return nil
        default:
            let headers: [String: Any] = [:]
            return headers
        }
    }
    public var path: String {
        switch self.mockEnum {
        case .badUrl?:
            return "/?https://?dssdss"
        default:
            return "https://orderexpressstg.cardinalhealth.com/forms/RWO/OEDMZLogin.fcc"
        }
    }
}

