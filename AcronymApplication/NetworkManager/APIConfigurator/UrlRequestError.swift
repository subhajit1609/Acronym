//
//  UrlRequestError.swift
//  AcronymApplication
//


import Foundation
public enum  UrlRequestError: Error {
     /// badUrl:  This error will throw when url is not valid.
    case badUrl
     /// bodyWithoutParameter: This error will throw when body is passed with parameter.
    case bodyWithoutParameter
     /// bodyWithoutValue: This error will throw when body is passed with value.
    case bodyWithoutValue
     /// noHeaders: This error will throw when no headers is passed.
    case noHeaders
    case JSONParsing
}
extension UrlRequestError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badUrl:
            return NSLocalizedString("Invalid url, Please provide valid url to create url request.", comment: "Url Request error")
        case .bodyWithoutParameter:
            return NSLocalizedString("Body without parameter , Please provide parameter to create body in url request.", comment: "Url Request error")
        case .bodyWithoutValue:
            return NSLocalizedString("Body without value, Please provide values in parameter to create body in  Url request.", comment: "Url Request error")
        case .noHeaders:
            return NSLocalizedString("No Header, Please provide header to create Url request", comment: "Url Request error")
        case .JSONParsing:
             return NSLocalizedString("Unable to parse the JSON", comment: "JSON parsing error")
        }
    }
}
