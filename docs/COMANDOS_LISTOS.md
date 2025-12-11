# 📋 COMANDOS LISTOS - COPY & PASTE PARA MAÑANA

## 🚨 INSTRUCCIONES PARA EL PRESENTADOR

### **ANTES DEL EVENTO:**
1. Compila: `sui move build`
2. Publica: `sui client publish --gas-budget 100000000`
3. **ANOTA LOS IDs** que aparezcan
4. **SUSTITUYE** en los comandos abajo

---

## 🔥 COMANDOS LISTOS (sustituir [PACKAGE_ID] y [PUBLISHER_ID])

### **COMANDO 1: Crear Display**
```bash
sui client call --function create_display --module meu_nft --package [PACKAGE_ID] --args [PUBLISHER_ID] --gas-budget 10000000
```

### **COMANDO 2: NFT de Ejemplo**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Taller Sui NFT" "¡Mi primer NFT creado en el evento!" "https://via.placeholder.com/400x400/0099ff/ffffff?text=Taller+NFT" --gas-budget 10000000
```

### **COMANDO 3: NFT Personalizado 1**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Arte Digital Latinoamericana" "Creado con orgullo en Latinoamérica" "https://via.placeholder.com/400x400/00ff00/ffffff?text=LATAM+NFT" --gas-budget 10000000
```

### **COMANDO 4: NFT Personalizado 2**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Revolución Blockchain" "¡El futuro llegó!" "https://via.placeholder.com/400x400/ff6b6b/ffffff?text=Futuro+NFT" --gas-budget 10000000
```

---

## 🎨 TEMAS LISTOS PARA CREAR EN EL EVENTO

### **Copy-paste listos (solo cambiar [PACKAGE_ID]):**

#### **Tema: Animales**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Gato Cósmico" "Un felino viajante del espacio" "https://via.placeholder.com/400x400/9b59b6/ffffff?text=Gato+Espacial" --gas-budget 10000000
```

#### **Tema: Comida**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Pizza Suprema" "La pizza más épica del universo" "https://via.placeholder.com/400x400/e74c3c/ffffff?text=Pizza+NFT" --gas-budget 10000000
```

#### **Tema: Tecnología**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "IA del Futuro" "Inteligencia artificial en NFT" "https://via.placeholder.com/400x400/3498db/ffffff?text=AI+NFT" --gas-budget 10000000
```

#### **Tema: Naturaleza**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Bosque Mágico" "La naturaleza en forma digital" "https://via.placeholder.com/400x400/27ae60/ffffff?text=Nature+NFT" --gas-budget 10000000
```

#### **Tema: Deporte**
```bash
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Gol Histórico" "El gol que cambió todo" "https://via.placeholder.com/400x400/f39c12/ffffff?text=Goal+NFT" --gas-budget 10000000
```

---

## 🆘 COMANDOS DE EMERGENCIA

### **Si da error de gas:**
```bash
sui client faucet
```

### **Ver objetos en la billetera:**
```bash
sui client objects
```

### **Ver saldo:**
```bash
sui client balance
```

### **Ver detalles de un NFT:**
```bash
sui client object [OBJECT_ID]
```

### **Recompilar (si algo sale mal):**
```bash
sui move build --clean
```

---

## 🌐 LINKS IMPORTANTES (abrir en pestañas)

### **Explorer para mostrar NFTs:**
```
https://suiexplorer.com/
```

### **Faucet (tokens gratis):**
```
https://faucet.devnet.sui.io/
```

### **Documentación (backup):**
```
https://docs.sui.io/
```

---

## 🎬 FRASES LISTAS PARA CADA COMANDO

### **Al compilar:**
> *"Ahora vamos a traducir nuestro código al lenguaje que la blockchain entiende."*

### **Al publicar:**
> *"Estamos colocando nuestro 'molde de NFT' en la red mundial. Esto va a generar algunos números importantes que voy a anotar."*

### **Al crear display:**
> *"Ahora vamos a crear la 'vitrina' que va a mostrar nuestros NFTs de forma bonita en las billeteras."*

### **Al crear primer NFT:**
> *"Y ahora... ¡el momento mágico! ¡Vamos a crear nuestro primer NFT!"*

### **Al mostrar en el explorer:**
> *"¡Miren esto! Aquí está nuestro NFT vivito en la blockchain. ¡Ahora existe para siempre!"*

---

## 📱 TEMPLATE DE PRESENTACIÓN EN EL CELULAR

### **Para enviar a tu jefe:**

```
🚀 GUIÓN RÁPIDO:

1️⃣ Hablar: "NFT = certificado digital"
2️⃣ Compilar: sui move build
3️⃣ Publicar: sui client publish...
4️⃣ Display: sui client call...
5️⃣ NFT: sui client call...
6️⃣ Mostrar en el explorer
7️⃣ Crear más NFTs con público

✅ Recordar: "¡Ahora son creadores digitales!"
```

---

## 🎯 EJEMPLO DE SECUENCIA COMPLETA

### **Para prueba esta tarde:**

```bash
# 1. Preparar
cd /home/f0ntz/Documents/meu_nft_exemplo
sui move build

# 2. Publicar
sui client publish --gas-budget 100000000
# ANOTA: Package: 0xabc123... Publisher: 0xdef456...

# 3. Display
sui client call --function create_display --module meu_nft --package 0xabc123... --args 0xdef456... --gas-budget 10000000

# 4. NFT
sui client call --function mint --module meu_nft --package 0xabc123... --args "NFT de Prueba" "¡Funcionó!" "https://via.placeholder.com/400x400/00ff00/ffffff?text=Exito" --gas-budget 10000000

# 5. Ver resultado
sui client objects
```

---

## 🔥 CONSEJO DE ORO

### **Si algo se rompe:**
1. **Mantén la calma**
2. **Di:** "Esto es normal en blockchain, vamos a resolverlo"
3. **Usa:** `sui client faucet` (primer intento)
4. **O:** Muestra NFTs ya creados en el explorer
5. **Backup:** Enfócate en los conceptos y deja práctica para después

---

## 💪 MENSAJE FINAL

**¡Tu jefe tiene TODO lo que necesita aquí!**

- ✅ Comandos listos para copy-paste
- ✅ Frases preparadas
- ✅ Planes B y C
- ✅ Tu soporte online

**¡MAÑANA VA A SER UN ÉXITO TOTAL! 🚀**
