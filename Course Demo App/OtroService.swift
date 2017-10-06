import Foundation
import Alamofire

struct OtroService {
    
    static func autenticar(username: String, password: String, completion: @escaping(_ result: SimpleRespuesta) -> Void) {
        
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60 // segundos
        
        manager.request("\(Constantes.WebServiceOtroURL)/api/authenticate", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                guard response.result.isSuccess else {
                    let answer = SimpleRespuesta(exito: false, mensaje: "Se superó el tiempo de espera, intente de nuevo.")
                    return completion(answer)
                }
                
                if let json = response.result.value as? [String: Any] {
                    if (json["id_token"] as? String) != nil {
                        
                        // Guardar json["id_token"] de forma segura
                        
                        let answer = SimpleRespuesta(exito: true, mensaje: "ok")
                        completion(answer)
                    } else {
                        let answer = SimpleRespuesta(exito: false, mensaje: "El apodo o la contraseña es incorrecta. Por favor revise sus datos e inténtalo de nuevo.")
                        completion(answer)
                    }
                } else {
                    let answer = SimpleRespuesta(exito: false, mensaje: "Error desconocido.")
                    completion(answer)
                }
        }
    }
    
}
