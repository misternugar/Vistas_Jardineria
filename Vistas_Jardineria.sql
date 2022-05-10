-- 1.Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los clientes y los pagos que ha realizado cada uno de ellos. 
-- La vista deberá tener las siguientes columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la transacción

CREATE OR REPLACE VIEW listado_pagos_clientes AS
    SELECT 
        CONCAT_WS(', ',
                c.nombre_contacto,
                c.apellido_contacto) AS nombre_completo,
        c.telefono,
        c.ciudad,
        c.pais,
        p.fecha_pago,
        p.total,
        p.id_transaccion
    FROM
        cliente c
            INNER JOIN
        pago p ON c.codigo_cliente = p.codigo_cliente;
        
-- 2. Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de ellos. 
-- La vista deáber tener las siguientes columnas: nombre y apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido, fecha del pedido, 
-- fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto de todas las cantidades por el precio de cada unidad, 
-- que aparecen en cada línea de pedido.

-- 3. Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de la ciudad de Madrid que han realizado pagos.

SELECT 
    *
FROM
    listado_pagos_clientes
WHERE
    ciudad = 'Madrid';
    
-- 4.Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes que todavía no han recibido su pedido.

SELECT 
    *
FROM
    listado_pagos_clientes
WHERE
    fecha_entrega IS NULL
        OR fecha_entrega = '9999-12-31';

-- 5. Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha realizado cada uno de los clientes.

-- 6. Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del pedido máximo y mínimo que ha realizado cada cliente.

SELECT 
    nombre_completo,
    tlfno,
    ciudad,
    pais,
    MAX(total_pedido),
    MIN(total_pedido)
FROM
    listado_pedidos_clientes
GROUP BY nombre_completo , tlfno , ciudad , pais;

-- 7. Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos. 
-- Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de la vista para comprobar que sigue funcionando correctamente.

-- 8. Elimine las vistas que ha creado en los pasos anteriores.