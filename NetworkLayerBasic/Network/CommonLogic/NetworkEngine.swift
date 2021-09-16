//
//  NetworkEngine.swift
//  NetworkLayerBasic
//
//  Created by Vikas S on 17/09/21.
//

import Foundation

class NetworkEngine{
    
    //1
    class func request<T: Codable>(endpoint: Endpoint,completion: @escaping (Result<T,Error>) -> ()){
        
        //2
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        //3
        guard let url = components.url else {return}
        
        //4
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        //5
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            
            //6
            guard error == nil else{
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard response != nil, let data = data else {return}
            
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data){
                    //7
                    completion(.success(responseObject))
                }else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey : "Failed to decode response"])
                    completion(.failure(error))
                }
            }
        }
        
        //8
        dataTask.resume()
    }
}
