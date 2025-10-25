import golosinas.*
/* Crear el objeto `mariano` con la capacidad de comprar golosinas, hacer cosas con las golosinas que tiene, y responder a consultas sobre las mismas. En particular, debe entender todos los mensajes que siguen:
* `comprar(unaGolosina)` : agrega una golosina a la bolsa de golosinas compradas.
* `desechar(unaGolosina)` : desecha la golosina escogida de la bolsa de golosinas.
* `cantidadDeGolosinas()` : devuelve la cantidad de golosinas compradas.
* `tieneLaGolosina(unaGolosina)` : pregunta si Mariano ya tiene la golosina que se quiere comprar en la bolsa de golosinas.
* `probarGolosinas()` : le da un mordisco a todas las golosinas dentro de la bolsa de golosinas compradas.
* `hayGolosinaSinTACC()` : indica si hay al menos una golosina sin gluten en la bolsa de golosinas compradas.
* `preciosCuidados()` : se cumple cuando cada una de las golosinas compradas tienen un precio menor o igual a 10 pesos.
* `golosinaDeSabor(unSabor)` : devuelve _la primer golosina_ que encuentra en la bolsa del sabor escogido.
* `golosinasDeSabor(unSabor)` : devuelve _las golosinas_ que encuentre dentro de la bolsa del sabor escogido.
* `sabores()` : que devuelve los sabores de las golosinas de la bolsa, idealmente sin repetidos. <br> 
  P.ej. aunque Mariano tenga tres golosinas de sabor naranja, en lo que devuelve `sabores()` el naranja debería aparecer una sola vez. <br> Una forma de resolver esto es usando **conjuntos**; revolver en el apunte sobre colecciones y closures: */
object mariano{
    const bolsaDeGolosinas = []

    method comprar(unaGolosina){
        bolsaDeGolosinas.add(unaGolosina)
    }
    method desechar(unaGolosina){
        bolsaDeGolosinas.remove(unaGolosina)
    }
    method cantidadDeGolosinas() = bolsaDeGolosinas.size()
    method tieneLaGolosina(unaGolosina) = bolsaDeGolosinas.contains(unaGolosina)
    method probarGolosinas(){
        bolsaDeGolosinas.forEach({unaGolosina => unaGolosina.mordizco()})
    }
    method hayGolosinaSinTACC() = bolsaDeGolosinas.any({unaGolosina => unaGolosina.esLibreDeGluten()})
    method preciosCuidados() = bolsaDeGolosinas.all({unaGolosina => unaGolosina.precio() <= 10})
    method golosinaDeSabor(unSabor) = bolsaDeGolosinas.find({unaGolosina => unaGolosina.sabor() == unSabor})
    method golosinasDeSabor(unSabor) = bolsaDeGolosinas.filter({unaGolosina => unaGolosina.sabor() == unSabor})
    method sabores() = bolsaDeGolosinas.map({unaGolosina => unaGolosina.sabor()}).asSet()
    method golosinaMasCara() = bolsaDeGolosinas.max({unaGolosina => unaGolosina.precio()})
    method pesoDeGolosinas() = bolsaDeGolosinas.sum({unaGolosina => unaGolosina.peso()})
    method golosinasFaltantes(golosinasDeseadas) =
        golosinasDeseadas.filter({unaGolosina => !self.tieneLaGolosina(unaGolosina)})
    method gustosFaltantes(gustosDeseados) =
        gustosDeseados.filter({unGusto => !self.tieneGolosinaDeSabor(unGusto)})
    method tieneGolosinaDeSabor(unSabor) =
        bolsaDeGolosinas.any({unaGolosina => unaGolosina.sabor() == unSabor})
}