

/// Módulo para crear un NFT de ejemplo con Display Estándar.
module meu_nft_exemplo::meu_nft {
    // --- Dependencias ---
    // Importaciones necesarias del framework de Sui.

    // Para crear el Display que muestra nuestro NFT en UIs.
    use sui::display;
    // Para usar el tipo String.
    use std::string::{Self, String};
    // Para poder obtener el Publisher en la inicialización.
    use sui::package::{Self, Publisher};

    // --- Definición del Objeto NFT ---

    /// One-Time Witness para el Publisher
    public struct MEU_NFT has drop {}

    /// La estructura principal de nuestro NFT.
    /// 'has key' permite que sea un objeto que puede ser poseído.
    /// 'has store' permite que sea colocado dentro de otras estructuras.
    public struct MeuNFT has key, store {
        id: UID,
        name: String,
        description: String,
        /// URL para la imagen del NFT (idealmente, un link de gateway IPFS https://).
        url: String
    }

    // --- Funciones de Inicialización ---

    /// Esta función es llamada solo UNA VEZ, cuando el módulo es publicado en la red.
    /// Crea el "Publisher", que es un objeto que nos da permiso para crear
    /// y actualizar el Display de nuestro tipo `MeuNFT`.
    fun init(otw: MEU_NFT, ctx: &mut TxContext) {
        // Crea un nuevo objeto Publisher para nuestro tipo `MeuNFT`.
        let publisher = package::claim(otw, ctx);
        // Transfiere el Publisher a la persona que está publicando el contrato.
        // Esto garantiza que solo el creador del contrato pueda cambiar cómo se muestran los NFTs.
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }

    // --- Funciones Públicas (Entry Functions) ---

    /// Crea ("mintea") una nueva instancia de nuestro NFT y la envía al llamador.
    entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        // Crea el objeto NFT con los datos proporcionados.
        let nft = MeuNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: string::utf8(url),
        };
        // Transfiere el NFT recién creado a la billetera que llamó esta función.
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }

    /// Crea y publica el objeto `Display` para el tipo `MeuNFT`.
    /// Esta función debe ser llamada SOLO UNA VEZ después de la publicación del contrato.
    /// Requiere el objeto `Publisher` (que fue obtenido en `init`) como prueba de autoridad.
    entry fun create_display(
        publisher: &Publisher,
        ctx: &mut TxContext
    ) {
        // Crea un nuevo objeto Display.
        let mut display = display::new_with_fields<MeuNFT>(
            publisher,
            // Nombres de los campos que aparecerán en el Display.
            // Estos son los nombres que las billeteras y exploradores van a leer.
            vector[
                string::utf8(b"name"),
                string::utf8(b"description"),
                string::utf8(b"image_url") // ¡Nombre estándar para la imagen!
            ],
            // Valores para los campos del Display.
            // Usamos "placeholders" (variables) que apuntan a los campos de nuestro struct `MeuNFT`.
            // "{name}" en el display va a mostrar el valor del campo "name" del NFT.
            // "{url}" en el display va a mostrar el valor del campo "url" del NFT.
            vector[
                string::utf8(b"{name}"),
                string::utf8(b"{description}"),
                string::utf8(b"{url}") // ¡Mapeamos nuestro campo 'url' al 'image_url' del display!
            ],
            ctx
        );

        // Actualiza la versión del display para hacerlo activo.
        display::update_version(&mut display);
        // Transfiere el objeto Display al sender.
        transfer::public_transfer(display, tx_context::sender(ctx));
    }
}
