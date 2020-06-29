//
//  Constant.swift
//  CompanyProject
//
//  Created by ons ben slimen on 6/24/20.
//  Copyright © 2020 Ons Ben Slimen. All rights reserved.
//

import Foundation
import Alamofire

struct Constants{
    struct  ProductionServer {
        static let baseURL = "http://192.168.0.101:3000/"
        
    }
}


enum HTTPHeaderField : String{
    case authentication = "authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
enum contentType: String {
    case json = "application/json"
     case formEncode = "application/x-www-form-urlencoded"
}
enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}
