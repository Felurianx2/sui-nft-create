# ⚡ BRIEFING RELÁMPAGO - 15 minutos para dominar todo

## 🎯 MISIÓN HOY
Vas a enseñar a personas con **cero conocimiento** a crear NFT. ¡Va a ser **genial**!

---

## 📚 MINUTO 1-3: QUÉ ES ESTE PROYECTO

- **Archivo principal:** `mi_nft_ejemplo.move` (es donde está el código)
- **Qué hace:** Crea NFTs (certificados digitales únicos) en la blockchain Sui
- **Lenguaje:** Move (como JavaScript, pero para blockchain)
- **Resultado:** La gente sale con NFT propio creado desde cero

---

## 🧠 MINUTO 4-6: CONCEPTOS QUE NECESITAS MENCIONAR

### **NFT**
> *"Es como acta de nacimiento de un arte digital. Prueba que eres el dueño original."*

### **Blockchain**
> *"Libro de registros gigante que queda en internet. Una vez escrito, nadie lo borra."*

### **Smart Contract** (nuestro código)
> *"Molde automático para crear NFTs. Como máquina de hacer certificados."*

### **Mint**
> *"Fabricar/crear el NFT. Como acuñar una moneda."*

---

## 💻 MINUTO 7-10: EL CÓDIGO (súper simplificado)

### **Estructura del NFT:**
```move
public struct MeuNFT has key, store {
    id: UID,           // DNI único del NFT
    name: String,      // Nombre (ej: "Mi Arte")
    description: String, // Descripción
    url: String        // Link de la imagen
}
```
> *"Nuestro NFT es como un DNI digital con nombre, descripción y foto."*

### **Función que crea NFT:**
```move
entry fun mint(name, description, url, ctx) {
    // 1. Arma el NFT con los datos
    // 2. Envía a quien llamó la función
}
```
> *"Función mint es nuestra máquina de hacer certificados."*

---

## 🚀 MINUTO 11-13: SECUENCIA PRÁCTICA

### **1. Compilar**
```bash
sui move build
```
> *"Traduciendo código para que blockchain entienda"*

### **2. Publicar**
```bash
sui client publish --gas-budget 100000000
```
> *"Colocando molde en la red. ¡ANOTA LOS IDs QUE APAREZCAN!"*

### **3. Display**
```bash
sui client call --function create_display ...
```
> *"Creando vitrina bonita para NFT"*

### **4. Crear NFT**
```bash
sui client call --function mint ...
```
> *"¡MOMENTO MÁGICO! ¡Creando primer NFT!"*

---

## 🎪 MINUTO 14-15: CONSEJOS DE PRESENTACIÓN

### **Para captar atención:**
- Empieza preguntando: *"¿Quién ya oyó hablar de NFT?"*
- Usa palabras simples: *"certificado"* en vez de *"token"*
- Celebra cada éxito: *"¡Perfecto! ¡Funcionó!"*

### **Si da error:**
- Mantén la calma: *"Blockchain es temperamental, vamos a resolverlo"*
- Usa backup: `sui client faucet` (pedir más tokens)
- Continúa: *"Vamos desde el último punto que funcionó"*

### **Frases que funcionan:**
- *"Hoy van a convertirse en creadores digitales"*
- *"Lo que hicieron vale oro en el mercado"*
- *"¡Ahora tienen superpoderes digitales!"*

---

## 🎯 RESUMEN FINAL

### **Tu secuencia:**
1. **Explicar conceptos** (NFT = certificado)
2. **Mostrar código** (molde para crear)
3. **Hacer juntos** (4 comandos en orden)
4. **Celebrar resultado** (mostrar en el explorer)

### **Mantra:**
> *"¡Simple, práctico, todos pueden!"*

### **Si olvidas algo:**
- Abre **CHEAT_SHEET.md** en una pestaña
- Ten **COLA_DEL_PRESENTADOR.md** abierto
- **COMANDOS_PRACTICOS.md** tiene todos los comandos listos

---

## 🚀 ¡VAS A ARRASAR!

**Recuerda:** Tu jefe es buena gente, la gente va a ser receptiva, y tienes TODO el material necesario. ¡Solo sigue el guión!

**¡La confianza es todo! 🔥 ¡Va a ser un éxito total!**
