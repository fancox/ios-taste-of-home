//
//  UIImage+.swift
//  TasteOfHome
//
//  Created by Fan Chen on 3/26/17.
//  Copyright © 2017 Fan Chen. All rights reserved.
//

import UIKit
import Foundation

extension UIImage {
    func fromURL(url: URL) -> UIImage {
        let request: URLRequest = URLRequest(url: url)
        NSURLSession.se
        NSURLConnection.sendAsynchronousRequest(
            request,
            queue: OperationQueue.main,
            completionHandler: { (response, data, error) in
                if let data = data {
                    return UIImage(data: data)
                } else {
                    return UIImage()
                }
        })
        
    }
}
