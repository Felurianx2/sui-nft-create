# 🛠️ Comandos Prácticos y Solución de Problemas - Evento NFT

## 🚀 Setup Inicial (Para Participantes)

### 1. Instalar Sui CLI
```bash
# Linux/macOS
curl -fLu/
sudo mv sui /usr/local/bin/

# Verificar instalación
sui --version
```

### 2. Configurar Billetera
```bash
# Crear nueva billetera
sui client new-address ed25519

# Ver direcciones disponibles
sui client addresses

# Ver billetera activa
sui client active-address

# Cambiar billetera activa
sui client switch --address [DIRECCIÓN]
```

### 3. Conseguir Tokens de Testnet
```bash
# Faucet para devnet
sui client faucet

# Verificar saldo
sui client balance
```

---

## 💼 Comandos del Taller

### 📁 Preparación del Proyecto
```bash
# Navegar a carpeta del proyecto
cd /home/f0ntz/Documents/meu_nft_exemplo

# Verificar archivos
ls -la

# Ver contenido del Move.toml
cat Move.toml
```

### 🔨 Compilación y Deploy

#### Compilar
```bash
sui move build
```

**Si da error:**
```bash
# Limpiar caché e intentar nuevamente
sui move build --clean
```

#### Publicar en Devnet
```bash
sui client publish --gas-budget 100000000
```

**Salida esperada:**
```
Published Objects:
- Package ID: 0x[HASH_LARGO]
- Publisher Object: 0x[HASH_LARGO]
```

**⚠️ IMPORTANTE:** ¡Copia y guarda el Package ID y Publisher Object!

### 🎨 Creando Display

```bash
sui client call \
  --function create_display \
  --module meu_nft \
  --package [PACKAGE_ID] \
  --args [PUBLISHER_OBJECT_ID] \
  --gas-budget 10000000
```

**Ejemplo real:**
```bash
sui client call \
  --function create_display \
  --module meu_nft \
  --package 0x123abc... \
  --args 0x456def... \
  --gas-budget 10000000
```

### 🎯 Minteando NFTs

#### Template Básico
```bash
sui client call \
  --function mint \
  --module meu_nft \
  --package [PACKAGE_ID] \
  --args "Nombre del NFT" "Descripción del NFT" "https://link-de-la-imagen.com" \
  --gas-budget 10000000
```

#### Ejemplos Prácticos

**NFT de Arte:**
```bash
sui client call \
  --function mint \
  --module meu_nft \
  --package [PACKAGE_ID] \
  --args "Atardecer Digital" "Un bello arte digital creado en el taller" "https://via.placeholder.com/400x400/ff6b6b/ffffff?text=Atardecer" \
  --gas-budget 10000000
```

**NFT de Meme:**
```bash
sui client call \
  --function mint \
  --module meu_nft \
  --package [PACKAGE_ID] \
  --args "Gato Programador" "Meme clásico sobre desarrolladores que trabajan de madrugada" "https://via.placeholder.com/400x400/4ecdc4/ffffff?text=Gato+Dev" \
  --gas-budget 10000000
```

**NFT Personalizado:**
```bash
sui client call \
  --function mint \
  --module meu_nft \
  --package [PACKAGE_ID] \
  --args "Mi Primera Experiencia Blockchain" "¡Hoy aprendí a crear NFTs en Sui y fue increíble!" "https://via.placeholder.com/400x400/45b7d1/ffffff?text=First+NFT" \
  --gas-budget 10000000
```

---

## 🔍 Verificación y Debugging

### Ver Objetos de la Billetera
```bash
# Ver todos los objetos
sui client objects

# Ver objetos de un tipo específico
sui client objects --filter package=[PACKAGE_ID]
```

### Ver Detalles de un Objeto
```bash
sui client object [OBJECT_ID]
```

### Ver Transacciones
```bash
# Ver transacciones recientes
sui client transaction [TX_DIGEST]

# Ver historial de transacciones
sui client transactions --count 10
```

### Explorer de Sui
```
https://suiexplorer.com/
```
- Pega el Object ID o Transaction ID para ver detalles

---

## 🚨 Solución de Problemas Comunes

### Error: "Insufficient Gas"
```bash
# Solicitar más tokens del faucet
sui client faucet

# Verificar saldo
sui client balance

# Intentar con más gas
--gas-budget 20000000
```

### Error: "Package not found"
**Causa:** Package ID incorrecto
**Solución:**
```bash
# Verificar último deploy
sui client transactions --count 5

# O recompilar y republicar
sui move build
sui client publish --gas-budget 100000000
```

### Error: "Module not found"
**Causa:** Nombre del módulo incorrecto
**Verificación:**
```move
// En el archivo .move, verificar:
module meu_nft_exemplo::meu_nft {  // ← Nombre correcto
```

### Error: "Publisher not found"
**Causa:** Publisher Object ID incorrecto
**Solución:**
```bash
# Verificar objetos de la billetera
sui client objects

# Buscar objeto del tipo "Publisher"
```

### Error: "Invalid UTF-8"
**Causa:** Caracteres especiales en los argumentos
**Solución:**
```bash
# Usar solo caracteres ASCII simples
# ✅ Correcto: "Mi NFT"
# ❌ Incorrecto: "Mi NFT con emojis 🚀"
```

---

## 📊 URLs de Imagen para Pruebas

### Placeholders Coloridos
```
# Azul
https://via.placeholder.com/400x400/0099ff/ffffff?text=Mi+NFT

# Rojo
https://via.placeholder.com/400x400/ff6b6b/ffffff?text=Arte+Digital

# Verde
https://via.placeholder.com/400x400/51cf66/ffffff?text=Blockchain+NFT

# Morado
https://via.placeholder.com/400x400/9775fa/ffffff?text=Taller+Sui
```

### Imágenes Públicas (Ejemplo)
```
# Pixel Art
https://cdn.pixabay.com/photo/2021/11/12/03/04/pixel-art-6787124_960_720.png

# Abstract Art
https://cdn.pixabay.com/photo/2022/01/11/21/48/link-6931554_960_720.png
```

---

## 🎯 Checklist del Taller

### ✅ Para el Presentador
- [ ] Sui CLI instalado y funcionando
- [ ] Billetera configurada con tokens
- [ ] Proyecto compilado
- [ ] Package publicado
- [ ] Display creado
- [ ] NFT de ejemplo minteado
- [ ] URLs de prueba preparadas

### ✅ Para los Participantes
- [ ] Sui CLI instalado
- [ ] Billetera creada
- [ ] Tokens del faucet recibidos
- [ ] Proyecto descargado/clonado
- [ ] Comandos probados

---

## 📋 Template de Comandos para Copy-Paste

### Secuencia Completa (Sustituye [PACKAGE_ID] y [PUBLISHER_ID])
```bash
# 1. Compilar
sui move build

# 2. Publicar
sui client publish --gas-budget 100000000

# 3. Crear Display (COPIA LOS IDs DEL PASO 2)
sui client call --function create_display --module meu_nft --package [PACKAGE_ID] --args [PUBLISHER_ID] --gas-budget 10000000

# 4. Mintear NFT
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Mi Primer NFT" "¡Creado en el taller Sui!" "https://via.placeholder.com/400x400/0099ff/ffffff?text=Taller+NFT" --gas-budget 10000000

# 5. Ver resultado
sui client objects
```

---

## 🔧 Configuraciones Avanzadas

### Cambiar Red (si es necesario)
```bash
# Ver redes disponibles
sui client envs

# Cambiar a devnet
sui client switch --env devnet

# Cambiar a testnet
sui client switch --env testnet
```

### Optimización de Gas
```bash
# Para operaciones simples: 10000000
# Para publicación: 100000000
# Para operaciones complejas: 200000000
```

### Backup de la Billetera
```bash
# Ver claves privadas (¡CUIDADO!)
sui keytool list

# Exportar billetera
sui keytool export [DIRECCIÓN] --key-identity [KEY_ID]
```

---

## 📞 Soporte Durante el Evento

### Links Útiles
- **Documentación Sui:** https://docs.sui.io/
- **Explorer:** https://suiexplorer.com/
- **Faucet:** https://faucet.devnet.sui.io/
- **Discord Sui:** https://discord.gg/sui

### Comandos de Emergencia
```bash
# Resetear todo
rm -rf ~/.sui
sui client

# Ver logs detallados
sui client publish --gas-budget 100000000 --verbose

# Verificar conectividad
sui client active-env
```

---

**🎉 ¡Buena suerte en el taller! ¡Recuerda: blockchain es sobre experimentación y aprendizaje!**
