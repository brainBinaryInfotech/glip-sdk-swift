public class Poster {
    public var options: PosterOptions
    public var webhookURL: String
    let GLIP_WEBHOOK_BASE_URL = "https://hooks.glip.com/webhook/"
    
    public init(webhookURLOrID:String) {
        self.options = PosterOptions(body: "")
        let needle: Character = "/"
        if let _ = webhookURLOrID.characters.indexOf(needle) {
            webhookURL = webhookURLOrID
        } else {
            webhookURL = self.GLIP_WEBHOOK_BASE_URL + webhookURLOrID
        }
    }
    
    public func sendMessage(body:String, activity:String?=nil, icon:String?=nil, title:String?=nil) {
        let messageOptions = PosterOptions(body: body, activity: activity, icon: icon, title: title)
        let requestOptions = self.options
        requestOptions.merge(messageOptions)
        let jsonBody = requestOptions.toJSON()
        
        print(jsonBody)
        
        let request = NSMutableURLRequest(URL: NSURL(string: webhookURL)!)
        request.HTTPMethod = "POST"
        request.HTTPBody = jsonBody.dataUsingEncoding(NSUTF8StringEncoding)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            // check for fundamental networking error
            data, response, error in guard error == nil && data != nil else {
                print("error=\(error)")
                return
            }
            
            // check for http errors
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {                           print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
}