// MARK : Lesson 7
// MARK : 1 Mart 2024

import UIKit

// ---------------------------
// ---------- Class ----------

// Class && Struct arasindaki farklar nedir. Mulakatlarda sikca sorulan bir soruymus.
// Class lar heap te tutulur.
// Class -> Reference Type -> Inheritance var -> Heap de tutulur -> Memory heak olmamasi icin kullanimina dikkat etmek lazim
// Struct -> Value Type -> Protocal kullanarak fake inheritance yapilir -> Hizlidir apple bunu oneriyor

class Arac {
    var tekerlerSayisi: Int
    var renk: String
    init(tekerlerSayisi: Int, renk: String) {
        self.tekerlerSayisi = tekerlerSayisi
        self.renk = renk
    }
}

let bmw = Arac(tekerlerSayisi: 4, renk: "kirmizi")
bmw.renk
bmw.tekerlerSayisi

let bmw2 = bmw
bmw.renk = "Siyah"
bmw.renk // referance type dan dolayi ikiside siyah olacak
bmw2.renk // referance type dan dolayi ikiside siyah olacak

// struncta init yaoma zorunlulugu yok kendisi onu ayarliyor

struct Araba {
    var model: Int
    var yakit: String
}

var araba = Araba(model: 2024, yakit: "elektrikli")
araba.model
araba.yakit

var araba2 = araba
araba.yakit = "Hibrit"
araba.yakit
araba2.yakit


class Engine {
    var engineVolume: Int = 1680
}

class Vehicle {
    
    var model: Int = 2021
    var engine: Engine
    
    init() {
        
       engine = Engine()
    }
}

class Arabam: Vehicle {
    
    var tekerlekSayisi: Int
    var renk: String
    
    init(tekerlekSayisi: Int, renk: String) {
        self.tekerlekSayisi = tekerlekSayisi
        self.renk = renk
    }
}

let arabam = Arabam(tekerlekSayisi: 4, renk: "mor")
arabam.model

// OOP
// inheritence, polymorfizm, soyutlama(abstract), encapsulation
// neden polymorfizm cok onemlidir.

/*
 Protocals(POP)
 diger dillerdeki interface gibidir
 Sozlesme gibidir, uyulmasi zorunludur(zorunlu olmayan halleri vardir)
 Method, property , taslak olarak tanimlanir.
 */

protocol Player {
    var playerName: String { get }
    var alive: Bool { get set }
    var health: Int { get set }
    func shot()
}



enum Genre {
    case war
    case race
}

class Game: Player {
    
}

// static nedir arastir onemliiiii



// Odev sprite kit okullanbilirsin odevde 1 hafta sure 










