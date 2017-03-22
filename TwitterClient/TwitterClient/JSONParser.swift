//
//  JSONParser.swift
//  TwitterClient
//
//  Created by David Cole on 3/20/17.
//  Copyright © 2017 David Cole. All rights reserved.
//

import Foundation

typealias JSONParserCallback = (Bool, [Tweet]?)->()

class JSONParser{
    
    static var sampleJSONData : Data {
        guard let tweetJSONPath = Bundle.main.url(forResource: "tweet", withExtension: "json") else {
            fatalError("Tweet.json does not exist in this bundle") }
        
        do {
            let tweetJSONData = try Data(contentsOf: tweetJSONPath)
            
            return tweetJSONData
            
        
        } catch {
            fatalError("Falied to create data from tweetJSONPath")
        }
    }
    
    class func tweetsFrom(data: Data, callback: JSONParserCallback){
            // This is the typealias that we declared above ^^
        
        do {
            if let rootObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]]{
                var tweets = [Tweet]()
                
                for tweetDictionary in rootObject {
                    if let tweet = Tweet(json: tweetDictionary) {
                        tweets.append(tweet)
                }
            }
                callback(true, tweets)
                
            }
        } catch {
            print("Error Serializing JSON")
            callback(false, nil)
        }
    }
}
