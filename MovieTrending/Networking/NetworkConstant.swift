//
//  NetworkConstant.swift
//  MovieTrending
//
//  Created by Bruno Mazzocchi on 30/6/24.
//

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singleton 
    }
    
    public var apiKey: String {
        // Read only
        get {
            return ProcessInfo.processInfo.environment["API_KEY"] ?? ""
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var trending: String {
        get {
            return "trending/all/day?api_key=" + apiKey
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
