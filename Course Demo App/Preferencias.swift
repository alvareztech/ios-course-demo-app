import Foundation
import SwiftKeychainWrapper

struct Preferencias {

    static func guardarCorreo(correo: String) {
        let defaults = UserDefaults.standard
        defaults.set(correo, forKey: "UserEmail")
    }
    
    static func obtenerCorreo() -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "UserEmail") ?? ""
    }
    
    static func guardarPassword(password: String) -> Bool {
        return KeychainWrapper.standard.set(password, forKey: "UserPassword")
    }
    
    static func obtenerPassword() -> String {
        let pass: String? = KeychainWrapper.standard.string(forKey: "UserPassword")
        return pass ?? ""
    }
    
    static func eliminarPassword() -> Bool {
        return KeychainWrapper.standard.removeObject(forKey: "UserPassword")
    }
    
}
