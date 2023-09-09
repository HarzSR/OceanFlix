//
//  APICaller.swift
//  OceanFlix
//
//  Created by Hariharan Thiagarajan on 8/09/23.
//

import Foundation

struct Constants {
    
    static let API_KEY = "cb51a0235318bb3385b2d2b4303e2584"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let headers = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYjUxYTAyMzUzMThiYjMzODViMmQyYjQzMDNlMjU4NCIsInN1YiI6IjY0ZmVmOWY4MmRmZmQ4MDBlM2QzNTJjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jw-yQF-w3rHhNOCgIotNBYtr9-SIfGe4aq_HXPcOhE4"
      ]
    
}

class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(Constants.baseURL)trending/movie/day?language=en-US")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            }
            else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
    }
    
}
