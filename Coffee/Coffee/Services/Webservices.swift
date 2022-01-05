//
//  Webservices.swift
//  Coffee
//
//  Created by 오국원 on 2021/12/29.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}
enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
}
struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource {
    init(url:URL) {
        self.url = url
    }
}

class Webservice {
    //제네릭 함수, 여기서 T는 타입을 말하며 꺽쇠는 자리표시타입이름
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else{ // get the data
                completion(.failure(.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data) //get some sort of result
            
            if let result = result{//success
                DispatchQueue.main.async {//main thread에 패스하기 위해 비동기 
                    completion(.success(result))
                }
            }else{//not success
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
