# 📇 CHEAT SHEET - HOJA RÁPIDA DEL PRESENTADOR

## 🎯 3 CONCEPTOS PRINCIPALES
1. **NFT** = Certificado digital único (como DNI del arte)
2. **Blockchain** = Libro de registros que nadie falsifica
3. **Smart Contract** = Molde para crear NFTs

## ⚡ 4 COMANDOS ESENCIALES
```bash
# 1. COMPILAR
sui move build

# 2. PUBLICAR (¡anotar PACKAGE_ID y PUBLISHER_ID!)
sui client publish --gas-budget 100000000

# 3. DISPLAY (usar IDs copiados)
sui client call --function create_display --module meu_nft --package [PACKAGE_ID] --args [PUBLISHER_ID] --gas-budget 10000000

# 4. CREAR NFT
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Nombre" "Descripción" "URL" --gas-budget 10000000
```

## 🗣️ FRASES MÁGICAS
- **Inicio:** "NFT es un certificado que prueba que eres dueño de algo digital"
- **Código:** "Estamos creando un molde que cualquiera puede usar"
- **Compilar:** "Traduciendo a lenguaje de la blockchain"
- **Publicar:** "Colocando nuestro molde en la red mundial"
- **Display:** "Creando vitrina para mostrar NFT bonito"
- **Mint:** "¡Fabricando nuestro primer certificado digital!"

## 🚨 SOS - SI SALE MAL
- **Error gas:** `sui client faucet`
- **No encuentra package:** Republicar todo
- **Se trabó:** "Vamos desde el último punto que funcionó"
- **Perdido:** `sui client objects` (muestra lo que hay en la billetera)

## 🎪 INTERACCIÓN CON PÚBLICO
- **Pregunta inicial:** "¿Quién ya oyó hablar de NFT?"
- **Durante:** "¿Esto es magia o tecnología?" (risas)
- **Resultado:** "¡Felicitaciones! ¡Ahora son creadores de NFT!"

## 📱 URLs IMPORTANTES
- **Explorer:** https://suiexplorer.com/ (mostrar NFTs creados)
- **Faucet:** https://faucet.devnet.sui.io/ (pedir tokens)

## 🎯 ESTRUCTURA (60 min)
- **0-10min:** Conceptos + interacción
- **10-25min:** Código línea por línea
- **25-50min:** Hands-on (4 comandos)
- **50-60min:** Personalización + Q&A

## 💡 CONSEJO DE ORO
**Si algo se rompe:** Mantén la calma, di "blockchain a veces es temperamental, ¡pero vamos a resolverlo!" y sigue al próximo paso.

---
**¡PUEDES HACERLO! 🚀 ¡SOLO SIGUE EL GUIÓN!**
