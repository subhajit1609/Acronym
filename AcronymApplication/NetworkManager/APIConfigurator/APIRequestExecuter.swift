//
//  APIRequestExecuter.swift
//  AcronymApplication
//


import Foundation
public protocol APIRequestExecuterProtocol {
    /**
     Call this function to creates a task that retrieves the contents of a URL based on the specified URL request object, and calls a handler upon completion.
     - Parameter urlRequest: This is URLRequest type, which is used to execute the network call.
     - Parameter completionHandler: A block object to be executed when the task finishes successfully. This block has no return value and takes three arguments: the Data,URLResponse and Error.
     */
    func dataTaskRequest(from urlRequest: URLRequest, completionHandler: @escaping (Data?, HTTPURLResponse?, Error?) -> Void)
}
public class NSURLSession: NSObject, APIRequestExecuterProtocol {
    static let shared  = NSURLSession()
    var defaultSession: URLSession
     init(with session: URLSession = URLSession(configuration: .default)) {
        self.defaultSession = session
    }
    public func dataTaskRequest(from urlRequest: URLRequest, completionHandler: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        let sessionTask = self.defaultSession.dataTask(with: urlRequest) { (data, response, error) in
            completionHandler(data, response as? HTTPURLResponse, error)
        }
        sessionTask.resume()
    }
}
