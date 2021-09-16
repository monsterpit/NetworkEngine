//
//  FlickerModels.swift
//  NetworkLayerBasic
//
//  Created by Vikas S on 17/09/21.
//

import Foundation

struct FlickrResponse: Codable{
    let photos: FlickrResultPage?
}

struct FlickrResultPage: Codable{
    let page: Int?
    let pages: Int?
    let photo: [FlickrPhoto]?
}

struct FlickrPhoto: Codable{
    let id: String?
    let owner: String?
    let secret: String?
    let server: String?
    let farm: Int?
}
