//
//  MockEnums.swift
//  AcronymApplication
//


import Foundation
enum RepositoryMockResult {
    case successWithValue
    case failureWithError
}
enum RemoteDatasourceMockResult {
    case successWithValue
    case failureWithError
}
enum AcronymAPIMockResult {
    case successWithValue
    case failureWithError
}
enum AcronymApplicationError: Error {
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsuppotedURL
}
enum ServerAPIMockResult {
    case apiSuccess
    case apiError
    case apiErrorNil
    case apiSuccessWithEmptyArray
    case apiSuccessWithUniqueValue
    case apiSuccessWithSameValue
    case invalidData
}
