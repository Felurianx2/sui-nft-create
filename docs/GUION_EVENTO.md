# 🎨 NFT en Sui - Guía Rápida para el Evento

## 🏃‍♂️ GUIÓN DE PRESENTACIÓN (45-60 minutos)

---

## 📊 DIAPOSITIVA 1: Introducción (5 min)
### "¿NFT? ¿Blockchain? ¿Move? ¡Vamos a simplificarlo!"

**Para principiantes:**
- 🖼️ **NFT** = Certificado digital único (como sello de autenticidad)
- ⛓️ **Blockchain** = Libro de registros que nadie puede falsificar
- 🏎️ **Sui** = Blockchain moderna y rápida
- 🔧 **Move** = Lenguaje para crear contratos inteligentes

**Analogía simple:**
> "Es como crear un certificado de autenticidad digital para una obra de arte que queda guardado en una caja fuerte pública que todos pueden ver, pero nadie puede falsificar."

---

## 📊 DIAPOSITIVA 2: Estructura del Proyecto (5 min)
### "Cómo organizamos nuestro código"

```
meu_nft_exemplo/
├── Move.toml          ← "Identidad del proyecto"
├── sources/           ← "Nuestro código principal"
│   └── mi_nft_ejemplo.move
├── tests/            ← "Pruebas"
└── build/            ← "Archivos compilados"
```

**Explicación:**
- **Move.toml** = Como un "documento de identidad" del proyecto
- **sources/** = Donde escribimos el código que crea los NFTs
- **build/** = La computadora genera esto automáticamente

---

## 📊 DIAPOSITIVA 3: Anatomía del NFT (10 min)
### "¿Qué hay dentro de un NFT?"

```move
public struct MeuNFT has key, store {
    id: UID,           ← "DNI del NFT" (único)
    name: String,      ← "Nombre" (ej: "Arte Digital #1")
    description: String, ← "Descripción" (ej: "Mi primer arte")
    url: String        ← "Link de la imagen"
}
```

**Características importantes:**
- **`has key`** = Puede tener dueño (como una casa)
- **`has store`** = Puede ser guardado (como en una colección)
- **`UID`** = Identidad única (como huella digital)

---

## 📊 DIAPOSITIVA 4: Código Principal - Parte 1 (10 min)
### "Configurando las herramientas"

```move
module meu_nft_exemplo::meu_nft {
    // Importando herramientas
    use sui::display;           ← Para mostrar NFT bonito
    use std::string::String;    ← Para trabajar con texto
    use sui::package::Publisher; ← Para probar autoría
```

**Analogía de las herramientas:**
- `display` = Vitrina de la tienda (cómo aparece el NFT)
- `string` = Herramienta para escribir/leer texto
- `package` = Notaría (prueba que eres el creador)

---

## 📊 DIAPOSITIVA 5: Código Principal - Parte 2 (10 min)
### "Creando NFTs - La función mint()"

```move
entry fun mint(
    name: vector<u8>,        ← Nombre en formato de bytes
    description: vector<u8>, ← Descripción en bytes
    url: vector<u8>,         ← URL de la imagen en bytes
    ctx: &mut TxContext      ← Información de la transacción
) {
    // 1. Crear el NFT
    let nft = MeuNFT {
        id: object::new(ctx),              ← Genera ID único
        name: string::utf8(name),          ← Convierte a texto
        description: string::utf8(description),
        url: string::utf8(url),
    };

    // 2. Enviar a quien llamó la función
    transfer::public_transfer(nft, tx_context::sender(ctx));
}
```

**Proceso simplificado:**
1. 📝 Recibe la información
2. 🏗️ Arma el NFT
3. 📤 Envía a tu billetera

---

## 📊 DIAPOSITIVA 6: Display - La "Vitrina" (5 min)
### "Cómo aparece tu NFT en las billeteras"

```move
entry fun create_display(publisher: &Publisher, ctx: &mut TxContext) {
    let mut display = display::new_with_fields<MeuNFT>(
        publisher,
        // QUÉ mostrar
        vector[b"name", b"description", b"image_url"],
        // DE DÓNDE viene cada info
        vector[b"{name}", b"{description}", b"{url}"],
        ctx
    );
}
```

**Cómo funciona:**
- Define **qué campos** mostrar (`name`, `description`, `image_url`)
- Define **de dónde** viene cada información (`{name}`, `{description}`, `{url}`)
- Es como crear un "template" de cómo exhibir el NFT

---

## 📊 DIAPOSITIVA 7: Hands-On - Parte 1 (10 min)
### "¡Vamos a poner manos a la obra!"

### PASO 1: Compilar
```bash
sui move build
```
**Lo que sucede:** Transforma nuestro código en algo que la blockchain entiende

### PASO 2: Publicar
```bash
sui client publish --gas-budget 100000000
```
**Lo que sucede:** Coloca nuestro "molde de NFT" en la blockchain

### PASO 3: Crear Display
```bash
sui client call --function create_display --module meu_nft \
  --package [PACKAGE_ID] --args [PUBLISHER_ID] --gas-budget 10000000
```
**Lo que sucede:** Crea la "vitrina" para nuestros NFTs

---

## 📊 DIAPOSITIVA 8: Hands-On - Parte 2 (10 min)
### "¡Creando tu primer NFT!"

### PASO 4: Mintear NFT
```bash
sui client call --function mint --module meu_nft \
  --package [PACKAGE_ID] \
  --args "Mi Primer NFT" "¡Creado en el taller de hoy!" "https://ejemplo.com/imagen.png" \
  --gas-budget 10000000
```

### EJEMPLOS PRÁCTICOS:
```bash
# NFT de Arte Digital
--args "Atardecer Digital" "Arte creada con IA" "https://mi-arte.com/atardecer.png"

# NFT de Meme
--args "Gato Programador" "Meme sobre desarrolladores" "https://mis-memes.com/gato.jpg"

# NFT de Música
--args "Beat Lofi #1" "Música relajante para programar" "https://mi-musica.com/cover.png"
```

---

## 📊 DIAPOSITIVA 9: Conceptos Importantes (5 min)
### "Cosas que necesitas saber"

### 🔐 **Seguridad**
- **One-Time Witness** = Solo funciona una vez (prueba de originalidad)
- **Publisher** = Solo el creador puede modificar el Display
- **UID** = Cada NFT tiene ID único e inmutable

### 💰 **Gas/Combustible**
- Toda operación en la blockchain cuesta "gas"
- Es como combustible del auto
- Valores mayores = transacción más rápida

### 🔄 **Transferencia**
- Los NFTs pueden ser enviados a otras billeteras
- La propiedad queda registrada en la blockchain
- Imposible de falsificar o duplicar

---

## 📊 DIAPOSITIVA 10: Desafío Final (10 min)
### "¡Tu turno de crear!"

### 🎯 **DESAFÍO:**
Crea un NFT con tema **"Mi Primera Experiencia con Blockchain"**

### 📝 **REQUISITOS:**
1. **Nombre creativo** relacionado al tema
2. **Descripción personal** (cómo fue la experiencia)
3. **Imagen** (puedes usar cualquier URL pública)

### 🚀 **BONUS:**
- Modifica el código para agregar un campo `creator`
- Agrega un campo `date_created`
- Personaliza los mensajes de display

### 💡 **PISTA:**
Usa este template:
```
Nombre: "Mi Viaje Blockchain - [Tu Nombre]"
Descripción: "¡Hoy aprendí a crear NFTs y fue [tu impresión]!"
URL: "https://via.placeholder.com/400x400/0099ff/ffffff?text=Mi+NFT"
```

---

## 📊 DIAPOSITIVA 11: Próximos Pasos (5 min)
### "¿Hacia dónde ir ahora?"

### 🔧 **Mejoras Posibles:**
- Agregar campos de rareza
- Crear sistema de regalías
- Implementar colecciones
- Agregar metadata más compleja

### 🌐 **Conectar con Interfaces:**
- Crear frontend web
- Conectar con billeteras
- Marketplace propio

### 📚 **Recursos para Estudiar:**
- [Documentación Sui](https://docs.sui.io/)
- [Move Language](https://move-language.github.io/)
- [Ejemplos de Código](https://github.com/MystenLabs/sui/tree/main/examples)

---

## 📊 DIAPOSITIVA 12: Q&A y Conclusión (10 min)
### "Preguntas y Reflexiones"

### ✅ **Lo que aprendimos hoy:**
- Cómo funciona un NFT por dentro
- Cómo programar en Move (lenguaje de Sui)
- Cómo publicar en la blockchain
- Cómo crear y transferir NFTs

### 🤔 **Preguntas Comunes:**
- **"¿Puedo ganar dinero con esto?"** - Sí, creando NFTs valiosos o servicios
- **"¿Es difícil aprender?"** - Con práctica, se vuelve más fácil
- **"¿Necesito ser programador?"** - Ayuda, pero existen herramientas visuales
- **"¿Es caro publicar?"** - Depende de la red, Sui es bastante económica

### 🎯 **Desafío para Casa:**
¡Crea una colección de 5 NFTs con tema propio!

---

## 🎉 **¡FELICITACIONES!**
### ¡Ahora son creadores de NFTs en la blockchain Sui!

**¡Continúen explorando, creando y aprendiendo! 🚀**
