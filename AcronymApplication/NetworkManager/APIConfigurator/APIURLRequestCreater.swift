//
//  APIURLRequestCreater.swift
//  AcronymApplication
//

import Foundation

public struct APIURLRequestCreater {
    let charectorSet = "=!*'();:@&+$,/?%#[] "

    /**
     Call this function to create URLRequest using OEAPIConfigurableProtocol instance.
     - Parameter request: This is OEAPIConfigurableProtocol type, which is used to create URLRequest based on APIs provided.
     - Returns: No return
     */
    func createRequest(request: APIConfigurableProtocol) throws -> URLRequest? {
        var apiRequest: URLRequest
        let fullUrl = request.path
        guard fullUrl.isValidURL, let urlString = URL(string: fullUrl) else {
            throw  UrlRequestError.badUrl
        }
        apiRequest = URLRequest(url: urlString)
        apiRequest.httpMethod = request.method.rawValue
         let headers = request.headers
        headers.forEach { apiRequest.addValue(($0.value as? String)!, forHTTPHeaderField: $0.key) }
        switch request.parameters {
        case .bodyParamsEncoding(let params):
            if let params = params as? [String: String] {
                var keyValueArray = [String]()
                for (key, value) in params {
                    let keyValuePair = ("\(key)=\(value)")
                    let allowedCharacterSet = (CharacterSet(charactersIn: charectorSet).inverted)
                    if let encodedPair = keyValuePair.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) {
                        keyValueArray.append(encodedPair)
                    }
                }
                guard keyValueArray.count > 0 else {
                    throw UrlRequestError.bodyWithoutValue
                }
                let joinedString = keyValueArray.joined(separator: "&")
                let body = joinedString.data(using: String.Encoding.ascii, allowLossyConversion: false)
                apiRequest.httpBody = body
            } else {
                throw UrlRequestError.bodyWithoutParameter
            }
        case .bodyParamDict(let params):
                let postData: NSData = try JSONSerialization.data(withJSONObject: params as Any, options: .prettyPrinted) as NSData
                apiRequest.httpBody = postData as Data
        case .urlParams(let params):
            if let params = params as? [String: String] {
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: pair.value)
                }
                guard var components = URLComponents(string: fullUrl) else {
                    throw UrlRequestError.badUrl
                }
                components.queryItems = queryParams
                apiRequest.url = URL(string: fullUrl)
            } else {
                throw UrlRequestError.bodyWithoutParameter
            }
        case .bodyArray(let array):
            let postData: NSData = try JSONSerialization.data(withJSONObject: array as Any, options: .prettyPrinted) as NSData
            apiRequest.httpBody = postData as Data
        default: break
        }
        return apiRequest
    }
}

