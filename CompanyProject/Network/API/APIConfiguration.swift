//
//  APIConfiguration.swift
//  CompanyProject
//
//  Created by ons ben slimen on 6/24/20.
//  Copyright © 2020 Ons Ben Slimen. All rights reserved.
//

import Foundation
import Alamofire


protocol  APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
