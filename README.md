# 🎨 Taller NFT en la Blockchain Sui

## 🎯 Descripción
Proyecto educacional completo para enseñar la creación de NFTs en la blockchain Sui utilizando el lenguaje Move. Material desarrollado para talleres y eventos de blockchain.

## 🚀 Lo que vas a aprender
- Cómo crear NFTs desde cero en la blockchain Sui
- Lenguaje de programación Move
- Conceptos de blockchain y contratos inteligentes
- Cómo publicar e interactuar con contratos en la red

## 📁 Estructura del Proyecto

```
meu_nft_exemplo/
├── sources/                    # Código fuente Move
│   └── mi_nft_ejemplo.move    # Contrato principal del NFT
├── tests/                     # Pruebas del contrato
├── docs/                      # 📚 Material educacional completo
│   ├── GUIA_COMPLETO_NFT.md   # Guía detallada línea por línea
│   ├── GUION_EVENTO.md        # Presentación estructurada (60 min)
│   ├── COLA_DEL_PRESENTADOR.md # Manual completo para presentador
│   ├── COMANDOS_PRACTICOS.md  # Comandos y solución de problemas
│   ├── EJERCICIOS_PRACTICOS.md # Actividades prácticas
│   ├── BRIEFING_15MIN.md      # Briefing rápido
│   ├── CHEAT_SHEET.md         # Hoja de referencia
│   ├── COMANDOS_LISTOS.md     # Comandos copy-paste
│   ├── PLANO_EMERGENCIA.md    # Para eventos de último momento
│   └── RESUMEN_EJECUTIVO.md   # Visión general completa
├── Move.toml                  # Configuración del proyecto
└── README.md                  # Este archivo
```

## 🎓 Para Educadores

### Material Listo para Usar:
- **Presentación completa** (45-60 minutos)
- **Explicaciones línea por línea** del código
- **Comandos listos** para copy-paste
- **Solución de problemas** comunes
- **Ejercicios prácticos** para diferentes niveles

### Cómo Usar:
1. **Para taller rápido:** Usa [GUION_EVENTO.md](docs/GUION_EVENTO.md)
2. **Para estudio profundo:** Usa [GUIA_COMPLETO_NFT.md](docs/GUIA_COMPLETO_NFT.md)
3. **Para emergencia:** Usa [CHEAT_SHEET.md](docs/CHEAT_SHEET.md) y [COMANDOS_LISTOS.md](docs/COMANDOS_LISTOS.md)

## 🛠️ Cómo Ejecutar

### Prerrequisitos:
- [Sui CLI](https://docs.sui.io/build/install) instalado
- Billetera configurada
- Tokens de prueba (faucet)

### Comandos Básicos:
```bash
# 1. Compilar
sui move build

# 2. Publicar
sui client publish --gas-budget 100000000

# 3. Crear Display
sui client call --function create_display --module meu_nft --package [PACKAGE_ID] --args [PUBLISHER_ID] --gas-budget 10000000

# 4. Crear NFT
sui client call --function mint --module meu_nft --package [PACKAGE_ID] --args "Nombre" "Descripción" "URL" --gas-budget 10000000
```

## 🎯 Público Objetivo
- **Principiantes** en blockchain y programación
- **Desarrolladores** que quieren aprender Move/Sui
- **Educadores** de tecnología
- **Entusiastas** de NFTs y Web3

## 📚 Recursos Adicionales
- [Documentación Sui](https://docs.sui.io/)
- [Move Language](https://move-language.github.io/)
- [Explorer Sui](https://suiexplorer.com/)

## 🤝 Contribuciones
¡Las contribuciones son bienvenidas! Este material fue creado para ser compartido y mejorado por la comunidad.

## 📄 Licencia
Este proyecto es de código abierto y libre para uso educacional.

---

**🚀 ¡Transforma conocimiento blockchain en experiencia práctica!**
