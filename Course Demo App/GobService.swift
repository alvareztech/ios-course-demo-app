import Foundation
import Alamofire

struct GobService {
    
    static func obtenerColegios(resourceId: String, limit: Int, completion: @escaping(_ result: [Colegio]) -> Void) {
        
        let parameters: Parameters = [
            "resource_id": resourceId,
            "limit": limit,
        ]
        
        Alamofire.request("\(Constantes.WebServiceBaseURL)/action/datastore_search", parameters: parameters).responseJSON { response  in
            
            var colegios: [Colegio] = []
            
            if let json = response.result.value as? [String : Any] {
                
                if let result = json["result"] as? [String : Any] {
                    
                    if let jsonArray = result["records"] as? [[String : Any]] {
                        
                        for json in jsonArray {
                            let cole = Colegio(dictionary: json)
                            colegios.append(cole)
                        }
                        completion(colegios)
                    
                    }
                    
                }
            }
        }
    }
    
}
