//
//  File.swift
//  WallpaperMVCApp
//
//  Created by Deniz Gülbahar on 6.07.2022.
//

import Foundation

let headers = [
    "X-RapidAPI-Key": "8fe6f065f6mshe827f1e2b294546p1ec1f7jsn9f1a66124ebe",
    "X-RapidAPI-Host": "bts-wallpapers.p.rapidapi.com"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://bts-wallpapers.p.rapidapi.com/categories")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
    }
})

dataTask.resume()
