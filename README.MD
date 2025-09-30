# BookStoreDB - Sistema de Gestión de Librería

Este proyecto consiste en el diseño e implementación de una base de datos relacional para una tienda de libros. El sistema permite gestionar libros, autores, clientes, pedidos y transacciones, incluyendo su inventario, historial de compras y relaciones geográficas de los clientes.

---

##  Requisitos Implementados

### Libros
- Tienen título, precio, editorial, categoría, ISBN único, fecha de publicación y stock.
- Pueden tener uno o varios autores.
- Búsqueda disponible por título, autor, categoría o ISBN.

### Autores
- Nombre, fecha de nacimiento y nacionalidad (relacionada con país).
- Relación muchos a muchos con libros.

### Clientes
- Nombre, correo electrónico, teléfono y dirección.
- La dirección está normalizada: Barrio → Ciudad → País.

### Pedidos
- Un cliente puede hacer múltiples pedidos.
- Cada pedido puede incluir múltiples libros con cantidades específicas.
- El estado del pedido puede ser: pendiente, procesado, completado.

### Transacciones
- Asociadas a pedidos.
- Incluyen método de pago (tarjeta, PayPal, etc.), fecha y total.

---

##  Diagrama UML E-R

El diseño del modelo entidad-relación fue realizado con **DrawSQL**.


Entidades principales:

- **Libros**
- **Autores**
- **Clientes**
- **Pedidos**
- **Transacciones**
- **DetallePedido**
- **Propiedad** (relación N:M entre autores y libros)
- **Dirección** (normalizada hasta país)

Relaciones clave:

- N:M entre Libros y Autores.
- 1:N entre Clientes y Pedidos.
- 1:N entre Pedidos y DetallePedido.
- 1:1 entre Pedidos y Transacciones.
- 1:N entre País → Ciudad → Barrio → Dirección → Cliente.




