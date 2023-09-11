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
    static let bearer = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYjUxYTAyMzUzMThiYjMzODViMmQyYjQzMDNlMjU4NCIsInN1YiI6IjY0ZmVmOWY4MmRmZmQ4MDBlM2QzNTJjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jw-yQF-w3rHhNOCgIotNBYtr9-SIfGe4aq_HXPcOhE4"
    
}

class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)trending/movie/day?language=en-US") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(Constants.bearer, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                // let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                // print(results)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
