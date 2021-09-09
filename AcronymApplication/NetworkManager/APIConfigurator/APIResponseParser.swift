//
//  APIResponseParser.swift
//  AcronymApplication
//


import Foundation
///OENetworkAPIErrors: This enum will help to capture http request APIs errors.
public enum NetworkAPIErrors: Error {
    ///Http APIs throw error when input of http request is bad.
    case badInput
    /// Http APIs throw error when http request return no data
    case noData
    /// Http APIs throw error when http request not contains valid json.
    case jsonParseError
    /// Http APIs throw error and error type is unknown.
    case serverFailedWithUnknownError
    /// Http APIs throw error and error type is JWT error.
    case serverFailedWithJWTError
    case networkNotReachable
}
extension NetworkAPIErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badInput:
            return NSLocalizedString("Bad input during request creation", comment: "API errors")
        case .noData:
            return NSLocalizedString("No data from API response", comment: "API errors")
        case .jsonParseError:
            return NSLocalizedString("json parse error during API response parsing", comment: "API errors")
        case .serverFailedWithUnknownError:
            return NSLocalizedString("Server unable to connect due to unknown reason", comment: "API errors")
        case .serverFailedWithJWTError:
            return NSLocalizedString("Server unable to connect due to JWT error", comment: "API errors")
        case .networkNotReachable:
            return NSLocalizedString("Network is not reachable, Please connect and try again", comment: "Network Error")
        }
    }
}

public enum APIResponseParser {
    case data(data: Data)
    case json(json: Any?)
    case error(errorCode: Int?, error: Error?)
    /**
     This method will initialise OEAPIResponseParser.
     - Parameter response: This is required parameter.
     - Parameter request: This is instance of OEAPIConfigurableProtocol and a required parameter.
     */
    init(_ response: (r: HTTPURLResponse?, d: Data?, e: Error?), for request: APIConfigurableProtocol) {
        guard let data = response.d else {
            self = .error(errorCode: response.r?.statusCode ?? 0, error: NetworkAPIErrors.noData)
            return
        }
        switch request.responseDataType {
        case .data:
            self = .data(data: data)
        case .json:
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? [String: AnyObject] {
                    self = .json(json: json)
                    return
                }
                else if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? [AnyObject] {
                    self = .json(json: json)
                    return
                }
            } catch _ {
                if request.responseDataType == .json {
                    if response.r?.statusCode == 201 {
                        self = .json(json: nil)
                    } else {
                        self = .error(errorCode: response.r?.statusCode, error: NetworkAPIErrors.jsonParseError)
                    }
                    return
                }
            }
            self = .json(json: nil)
        }
    }
}

