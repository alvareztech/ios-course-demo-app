import Foundation

struct Preferencias {

    static func guardarCorreo(correo: String) {
        let defaults = UserDefaults.standard
        defaults.set(correo, forKey: "UserEmail")
    }
    
    static func obtenerCorreo() -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "UserEmail") ?? ""
    }
    
}
