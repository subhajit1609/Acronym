//
//  URLSessionMock.swift
//  AcronymApplication
//


import Foundation
import UIKit
public enum URLSessionError: Error {
    case error400
    case error401
    case error500
}
extension NSURLSession {
   
    class func prepareWithMockedURLSession(url: URL, data: Data?, responseCode: Int?, error: URLSessionError? = nil) -> NSURLSession {
        let urlSessionMock = URLSessionMock()
        if let code = responseCode {
            let response = HTTPURLResponse(url: url, statusCode: code, httpVersion: nil, headerFields: nil)
            urlSessionMock.response = response
        }
        urlSessionMock.data = data
        urlSessionMock.error = error
        return NSURLSession(with: urlSessionMock)
    }
}
public class URLSessionMock: URLSession {
    var data: Data?
    var error: Error?
    var response: URLResponse?
    public override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskMock { [weak self] in
            guard let weakSelf = self else { return }
            completionHandler(weakSelf.data, weakSelf.response, weakSelf.error)
        }
    }
}
public class URLSessionDataTaskMock: URLSessionDataTask {
    private let task: () -> Void
    init(with task: @escaping () -> Void) {
        self.task = task
    }
    public override func resume() {
        self.task()
    }
    var iscancelCalled: Bool = false
    public override func cancel() {
        self.iscancelCalled = true
    }
}
