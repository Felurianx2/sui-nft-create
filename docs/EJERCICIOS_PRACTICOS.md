# 🎨 Ejercicios y Modificaciones Prácticas - Taller NFT

## 🎯 Niveles de Dificultad

### 🟢 PRINCIPIANTE: Personalizaciones Simples
### 🟡 INTERMEDIO: Nuevas Funcionalidades
### 🔴 AVANZADO: Recursos Complejos

---

## 🟢 EJERCICIOS PRINCIPIANTES

### 1. 📝 Cambiando Textos y Nombres

#### Ejercicio: Personaliza los mensajes
```move
// ANTES (línea ~4):
/// Módulo para crear un NFT de ejemplo con Display Estándar.
module meu_nft_exemplo::meu_nft {

// DESPUÉS - Personaliza:
/// ¡Mi módulo increíble para crear NFTs únicos!
module meu_nft_exemplo::meu_nft {
```

#### Ejercicio: Cambia el nombre del struct
```move
// ANTES:
public struct MeuNFT has key, store {

// DESPUÉS:
public struct ArtePersonal has key, store {
// ¡RECUERDA: Necesitas cambiar en TODO el código donde aparece MeuNFT!
```

### 2. 🎨 URLs de Prueba Personalizadas

#### Crea NFTs con diferentes temas:
```bash
# NFT de Mascota
sui client call --function mint --module meu_nft --package [PACKAGE_ID] \
--args "Mi Gato Max" "El gato más tierno del mundo" "https://via.placeholder.com/400x400/ff9f43/ffffff?text=Gato+Max" \
--gas-budget 10000000

# NFT de Comida
sui client call --function mint --module meu_nft --package [PACKAGE_ID] \
--args "Pizza Margherita" "La mejor pizza del universo" "https://via.placeholder.com/400x400/ff6b6b/ffffff?text=Pizza" \
--gas-budget 10000000

# NFT de Lugar
sui client call --function mint --module meu_nft --package [PACKAGE_ID] \
--args "Playa del Futuro" "Mi lugar favorito para relajar" "https://via.placeholder.com/400x400/74b9ff/ffffff?text=Playa" \
--gas-budget 10000000
```

---

## 🟡 EJERCICIOS INTERMEDIOS

### 3. ➕ Agregando Nuevo Campo: Creator

#### Paso 1: Modificar el struct
```move
public struct MeuNFT has key, store {
    id: UID,
    name: String,
    description: String,
    url: String,
    creator: String,  // ¡NUEVO CAMPO!
}
```

#### Paso 2: Actualizar función mint
```move
entry fun mint(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    creator: vector<u8>,  // ¡NUEVO PARÁMETRO!
    ctx: &mut TxContext
) {
    let nft = MeuNFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        url: string::utf8(url),
        creator: string::utf8(creator),  // ¡NUEVO CAMPO!
    };
    transfer::public_transfer(nft, tx_context::sender(ctx));
}
```

#### Paso 3: Actualizar el display
```move
let mut display = display::new_with_fields<MeuNFT>(
    publisher,
    vector[
        string::utf8(b"name"),
        string::utf8(b"description"),
        string::utf8(b"image_url"),
        string::utf8(b"creator")  // ¡NUEVO CAMPO EN EL DISPLAY!
    ],
    vector[
        string::utf8(b"{name}"),
        string::utf8(b"{description}"),
        string::utf8(b"{url}"),
        string::utf8(b"{creator}")  // ¡NUEVO VALOR!
    ],
    ctx
);
```

#### Paso 4: Prueba el nuevo campo
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] \
--args "Arte Digital #1" "Mi primera obra" "https://ejemplo.com/arte.png" "Juan Silva" \
--gas-budget 10000000
```

### 4. 🌟 Agregando Campo de Rareza

```move
public struct MeuNFT has key, store {
    id: UID,
    name: String,
    description: String,
    url: String,
    creator: String,
    rarity: String,  // Común, Raro, Épico, Legendario
}
```

#### Función mint actualizada:
```move
entry fun mint(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    creator: vector<u8>,
    rarity: vector<u8>,  // ¡NUEVO!
    ctx: &mut TxContext
) {
    let nft = MeuNFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        url: string::utf8(url),
        creator: string::utf8(creator),
        rarity: string::utf8(rarity),
    };
    transfer::public_transfer(nft, tx_context::sender(ctx));
}
```

#### Prueba con rareza:
```bash
# NFT Común
sui client call --function mint --module meu_nft --package [PACKAGE_ID] \
--args "Paisaje #1" "Un bello paisaje" "https://ejemplo.com" "Maria" "Común" \
--gas-budget 10000000

# NFT Legendario
sui client call --function mint --module meu_nft --package [PACKAGE_ID] \
--args "Dragón Dorado" "NFT ultra raro" "https://ejemplo.com" "Pedro" "Legendario" \
--gas-budget 10000000
```

---

## 🔴 EJERCICIOS AVANZADOS

### 5. 🏷️ Sistema de Tags/Categorías

```move
use std::vector;

public struct MeuNFT has key, store {
    id: UID,
    name: String,
    description: String,
    url: String,
    creator: String,
    rarity: String,
    tags: vector<String>,  // Lista de tags: ["arte", "digital", "azul"]
}
```

#### Función helper para tags:
```move
fun create_tags(tag_bytes: vector<vector<u8>>): vector<String> {
    let mut tags = vector::empty<String>();
    let mut i = 0;
    while (i < vector::length(&tag_bytes)) {
        let tag = vector::borrow(&tag_bytes, i);
        vector::push_back(&mut tags, string::utf8(*tag));
        i = i + 1;
    };
    tags
}
```

#### Función mint con tags:
```move
entry fun mint_with_tags(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    creator: vector<u8>,
    rarity: vector<u8>,
    tags: vector<vector<u8>>,  // [b"arte", b"digital", b"azul"]
    ctx: &mut TxContext
) {
    let nft = MeuNFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        url: string::utf8(url),
        creator: string::utf8(creator),
        rarity: string::utf8(rarity),
        tags: create_tags(tags),
    };
    transfer::public_transfer(nft, tx_context::sender(ctx));
}
```

### 6. 📊 Contador de NFTs Creados

```move
// Agregar al inicio del módulo
public struct NFTStats has key {
    id: UID,
    total_created: u64,
    creator_count: u64,
}

// Función para inicializar stats
entry fun init_stats(ctx: &mut TxContext) {
    let stats = NFTStats {
        id: object::new(ctx),
        total_created: 0,
        creator_count: 0,
    };
    transfer::share_object(stats);
}

// Modificar función mint para actualizar stats
entry fun mint_with_stats(
    stats: &mut NFTStats,
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext
) {
    // Incrementar contador
    stats.total_created = stats.total_created + 1;

    let nft = MeuNFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        url: string::utf8(url),
    };
    transfer::public_transfer(nft, tx_context::sender(ctx));
}
```

---

## 🎮 DESAFÍOS CREATIVOS

### Desafío 1: 🎨 Colección Temática
Crea 5 NFTs con tema único (ej: "Colores del Arcoíris")
```bash
# Rojo
--args "Arcoíris Rojo" "El color de la pasión" "https://via.placeholder.com/400x400/ff0000/ffffff?text=Rojo" "Tu Nombre" "Común"

# Azul
--args "Arcoíris Azul" "El color de la serenidad" "https://via.placeholder.com/400x400/0000ff/ffffff?text=Azul" "Tu Nombre" "Común"

# ... continúa con otros colores
```

### Desafío 2: 🏆 NFT con Metadata Rica
Crea un NFT que cuente una historia:
```move
public struct HistoryNFT has key, store {
    id: UID,
    title: String,
    story: String,        // Historia larga
    chapter: u64,         // Capítulo de la historia
    character: String,    // Personaje principal
    location: String,     // Dónde se desarrolla
    mood: String,         // Tono de la historia
    image_url: String,
}
```

### Desafío 3: 🎲 NFT Aleatorizado
Agrega elementos aleatorios basados en el timestamp:
```move
use sui::clock::{Self, Clock};

entry fun mint_random(
    base_name: vector<u8>,
    ctx: &mut TxContext,
    clock: &Clock
) {
    let timestamp = clock::timestamp_ms(clock);
    let random_suffix = timestamp % 1000;  // Número entre 0-999

    let name = string::utf8(base_name);
    string::append(&mut name, string::utf8(b" #"));
    string::append(&mut name, to_string(random_suffix));

    // ... resto de la función
}
```

---

## 🔧 TEMPLATES LISTOS

### Template 1: NFT de Arte Digital
```move
public struct DigitalArt has key, store {
    id: UID,
    title: String,
    artist: String,
    technique: String,    // "Digital Painting", "3D Render", etc.
    dimensions: String,   // "1920x1080", "4K", etc.
    year_created: String,
    image_url: String,
    edition_number: u64,  // 1 de 100, 2 de 100, etc.
    total_editions: u64,
}
```

### Template 2: NFT de Música
```move
public struct MusicNFT has key, store {
    id: UID,
    song_title: String,
    artist: String,
    genre: String,
    duration: String,     // "3:45"
    bpm: u64,            // Golpes por minuto
    key_signature: String, // "C Major"
    release_year: String,
    cover_art_url: String,
    audio_preview_url: String,
}
```

### Template 3: NFT de Coleccionable
```move
public struct Collectible has key, store {
    id: UID,
    name: String,
    series: String,       // "Series 1", "Genesis", etc.
    rarity_level: u8,     // 1-5 (1=común, 5=ultra raro)
    special_ability: String,
    power_level: u64,
    background_color: String,
    character_type: String,
    image_url: String,
    mint_number: u64,     // Número secuencial de creación
}
```

---

## 📋 Checklist de Modificaciones

### ✅ Para cada nueva propiedad:
- [ ] Agregar en el struct
- [ ] Agregar en la función mint (parámetro)
- [ ] Agregar en la creación del objeto
- [ ] Actualizar el display (si quieres mostrar)
- [ ] Recompilar y republicar
- [ ] Probar con comandos

### ✅ Prueba siempre:
```bash
# Después de modificar
sui move build

# Si compiló ok
sui client publish --gas-budget 100000000

# Crear display nuevamente
sui client call --function create_display ...

# Probar mint
sui client call --function mint ...
```

---

## 🎉 SHOWCASE FINAL

### ¡Presenta tu NFT único!
1. **Muestra tu código modificado**
2. **Explica tus adiciones**
3. **Demuestra tu NFT creado**
4. **Comparte el Object ID** para que otros vean

### Cómo verificar resultado:
```bash
# Ver tu NFT
sui client object [OBJECT_ID]

# Ver en el explorer
# https://suiexplorer.com/object/[OBJECT_ID]?network=devnet
```

---

**🚀 ¡Continúa experimentando! ¡La blockchain es tuya para explorar!**
