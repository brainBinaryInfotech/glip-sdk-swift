/// PosterOptions represents message options to be sent via a Glip webhook.
public class PosterOptions {
    public var body: String
    public var activity, icon, title: String?
    
    init(body: String, activity: String?=nil, icon: String?=nil, title :String?=nil) {
        self.body = body
        self.activity = activity
        self.icon = icon
        self.title = title
    }
    
    func merge(options:PosterOptions) {
        if (!options.body.isEmpty) {
            self.body = options.body
        }
        if (!(options.activity ?? "").isEmpty) {
            activity = options.activity
        }
        if (!(options.icon ?? "").isEmpty) {
            icon = options.icon
        }
        if (!(options.title ?? "").isEmpty) {
            title = options.title
        }
    }

    /**
        - returns: a `String` representing the JSON request payload.
    */
    public func toJSON() -> String {
        let dict = toDictionary()
        let jsonString: String?
        
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(rawValue: 0))
            jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding)
        } catch {
            jsonString = "{}"
        }
        
        return jsonString!
    }
    
    /**
        - returns: a `Dictionary<String, String>` representing the options dictionary.
    */
    public func toDictionary() -> Dictionary<String, String> {
        var data:Dictionary<String, String> = ["body": body]
        
        if (!(activity ?? "").isEmpty) {
            data["activity"] = activity
        }
        if (!(icon ?? "").isEmpty) {
            data["icon"] = icon
        }
        if (!(title ?? "").isEmpty) {
            data["title"] = title
        }
        
        return data
    }
}