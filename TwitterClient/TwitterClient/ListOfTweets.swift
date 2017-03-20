//
//  ListOfTweets.swift
//  TwitterClient
//
//  Created by David Cole on 3/20/17.
//  Copyright © 2017 David Cole. All rights reserved.
//

import Foundation

class ListOfTweets {
    
    static let shared = ListOfTweets()
    
    var tweetContainer = [Tweet]()
    
    private init(){}
    
    func add(tweet: Tweet){
        self.tweetContainer.append(tweet)
    }
    
    func remove(tweet: Tweet){
        self.tweetContainer.filter { (tweetItem) -> Bool in
            return tweet.id != tweetItem.id
        }
        
    }
    
    func getTweet(index: Int) -> Tweet{
        return self.tweetContainer[index]
    }
    
}
