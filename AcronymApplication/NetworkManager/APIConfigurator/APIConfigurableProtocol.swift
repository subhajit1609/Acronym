//
//  APIConfigurableProtocol.swift
//  AcronymApplication
//

import Foundation
/**
 This protocol contains all the methods and behaviour required to be define in APIs creater class.
 */
protocol APIConfigurableProtocol {
    /** path: path of the url, which will use to create URL Request. */
    var path: String { get }
    /** method: Configure http method required to create URL Request. */
    var method: HTTPMethodsType { get }
    /** parameters: Configure query parameter in Url or configure content in request body. */
    var parameters: URLRequestParameters { get }
    /** headers: Configure http headers required to create URL Request. */
    var headers: [String: Any] { get }
    /** responseDataType: Configure what type of response should return by the APIs */
    var responseDataType: ResponseDataType { get }
}
extension APIConfigurableProtocol {
    var parameters: URLRequestParameters {
       return .urlParams(urlParams:[:])
   }
    var headers: [String : Any] {
        return [:]
    }
}
/**
 This Enum used to configure http method type for Url request.
 */
 enum HTTPMethodsType: String {
    /// It will set method type as POST
    case post = "POST"
    /// It will set method type as PUT
    case put = "PUT"
    /// It will set method type as GET
    case get = "GET"
    /// It will set method type as DELETE
    case delete = "DELETE"
}

/**
 This Enum used to configure http body parameters or url query parameters.
 */
 enum URLRequestParameters {
    /// It will set request parameters as part of body with encoding with "&" required.
    case bodyParamsEncoding(bodyParams: [String: Any]?)
    /// It will set request parameters as part of urls components.
    case urlParams(urlParams: [String: Any]?)
    /// It will set array as part of body.
    case bodyArray(bodyArray: [Any]?)
    /// It will set request parameters as part of body.
    case bodyParamDict(bodyParams: [String: Any]?)
    /// It will set when request parameters not required.
    case none
}
/**
 This Enum used to configure response data type for the http request.
 */
 enum ResponseDataType {
    /// When response data type is json.
    case json
    /// When response data type is data.
    case data
}
