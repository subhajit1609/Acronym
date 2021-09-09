//
//  AcronymAPIHandler.swift
//  AcronymApplication
//


import Foundation
class AcronymAPIHandler: AcronymAPIHandlerProtocol {
    private let _mapper: RemoteMappable
    ///session: Instance of OEURLSession.
    private var _session: APIRequestExecuterProtocol
    ///session: Instance of an array. Which contains object of URLSessionTask type.
    private var _sessionTasks: [URLSessionTask] = []
    // initialiser
    required init(session: APIRequestExecuterProtocol  = NSURLSession.shared, remoteMapper: RemoteMappable) {
        self._session = session
        self._mapper = remoteMapper
    }
    func getAcronymList(paramater: AcronymSearchParamater, _ completion: @escaping ((Result<[AcronymsUsablesModel], Error>) -> Void)) {
        let fetchRequestCreator = AcronymSearchRequestCreater(params: paramater)
        do {
            if let urlRequest = try APIURLRequestCreater().createRequest(request: fetchRequestCreator) {
                self._session.dataTaskRequest(from: urlRequest){ [self] (data, response, error) in
                    let response = APIResponseParser.init((r: response, d: data, e: error), for: fetchRequestCreator)
                    switch response {
                    case .data(data: let data):
                        do {
                            let acronymList = try JSONDecoder().decode([AcronymsParsableModel].self, from: data)
                            guard let acronymModel = _mapper.mapParsablesToUsables(acronymList) as? [AcronymsUsablesModel] else {
                                completion(.failure(MappingError.failedParsableToUsable))
                                return
                            }
                            completion(.success(acronymModel))
                        } catch let error {
                            completion(.failure(error))
                        }
                    case .error(_, let error):
                        if let err = error {
                            completion(.failure(err))
                        } else {
                            completion(.failure(AcronymApplicationError.unknownError))
                        }
                    default: break
                        
                    }
                }
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}
