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

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    
    static let shared = APICaller()
    
    func getNowPlayingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)movie/now_playing?language=en-US") else { return }
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
                let results = try JSONDecoder().decode(AllResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
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
                let results = try JSONDecoder().decode(AllResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)trending/tv/day?language=en-US") else { return }
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
                let results = try JSONDecoder().decode(AllResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getUpComingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)movie/upcoming?language=en-US") else { return }
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
                let results = try JSONDecoder().decode(AllResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)movie/popular?language=en-US") else { return }
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
                let results = try JSONDecoder().decode(AllResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)movie/top_rated?language=en-US") else { return }
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
                let results = try JSONDecoder().decode(AllResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
}
