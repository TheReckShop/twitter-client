//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by David Cole on 3/20/17.
//  Copyright © 2017 David Cole. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        
        JSONParser.tweetsFrom(data: JSONParser.sampleJSONData) { (success, tweets) in
            
            if(success){
                guard let tweets = tweets else { fatalError("Tweets came back nil") }
                
                for tweet in tweets{
                    print(tweet.text)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Indexpath: \(indexPath.row)"
        
        return cell
        
        
    }

}

// We need to populate array of tweets (which is in ListOfTweets) ListOfTweets.shared.add(actual tweet being sent)

// Need to grap API returns... 
