//
//  Router.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 25.02.2022.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getCountries
    case getDetail(countryCode: String)
    
    var method: HTTPMethod {
        switch self {
        case .getCountries:
            return .get
        case .getDetail:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getCountries:
            return nil
        case .getDetail:
            return nil
        }
    }
    
    var url: URL {
        switch self {
        case .getCountries:
            let url = URL(string: BaseURL.countriesURL)!
            return url
        case .getDetail(let countryCode):
            let queryString = BaseURL.baseURL + countryCode + "/" + BaseURL.apiKeyURL
            let url = URL(string: queryString)!
            return url
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}

extension Router {
    struct BaseURL {
        static let baseURL: String = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/"
        static let apiKeyURL: String = "?rapidapi-key=db519c31a8msh52aef075d7d2006p1937fajsn91fcf47961df"
        static let countriesURL: String = baseURL + apiKeyURL
        
    }
}
