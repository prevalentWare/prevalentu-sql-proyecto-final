# Proyecto de Gestión Agrícola

## Introducción

Este proyecto propone un sistema de gestión para fincas agrícolas, y permite el seguimiento y administración de diferentes cultivos, lotes, recogidas, despachos, y facturación, entre otros. A través del esquema de base de datos proporcionado, se puede realizar un seguimiento de varios aspectos clave de las operaciones agrícolas, desde la plantación hasta la venta de productos.

El gerente de la empresa requiere ciertas informaciones históricas sobre el desempeño de sus cultivos. Es responsabilidad del cursante ayudarle al gerente a responder sus inquietudes.

## Estructura de la Base de Datos

### Descripción de Tablas

1. **m_cultivo**:
   - `id` (text): Identificador único para cada tipo de cultivo.
   - `nombre` (text): Nombre del cultivo.
   - Representa diferentes tipos de cultivos que se pueden tener en una finca.
2. **finca**:
   - `id` (text): Identificador único para cada finca.
   - `nombre` (text): Nombre de la finca.
   - Representa las fincas donde se lleva a cabo la agricultura. Cada finca puede tener varios lotes.
3. **lote**:
   - `id` (text): Identificador único para cada lote.
   - `nombre` (text): Nombre del lote.
   - `id_finca` (text): Identificador de la finca a la que pertenece el lote.
   - `id_cultivo` (text): Identificador del tipo de cultivo en el lote.
   - Representa una subdivisión de una finca. En cada lote se cultiva un tipo específico de cultivo.
4. **usuario**:
   - `id` (text): Identificador único para cada usuario.
   - `nombre` (text): Nombre del usuario.
   - `correo` (text): Correo electrónico del usuario.
   - Representa los usuarios que interactúan con el sistema, estos pueden ser empleados o administradores.
5. **recogida**:
   - `id` (text): Identificador único para cada recogida.
   - `fecha` (timestamp): Fecha y hora en que se realizó la recogida.
   - `id_lote` (text): Identificador del lote donde se realizó la recogida.
   - `cantidad` (float): Cantidad de producto recogido en kilogramos.
   - `id_usuario` (text): Identificador del usuario que realizó la recogida.
   - `id_despacho` (text): Identificador del despacho en el que se incluyó la recogida.
   - Representa el evento de recogida de productos en un lote específico por un usuario específico.
6. **cliente**:
   - `id` (text): Identificador único para cada cliente.
   - `nombre` (text): Nombre del cliente.
   - Representa los clientes que compran los productos agrícolas.
7. **factura**:
   - `id` (text): Identificador único para cada factura.
   - `fecha` (timestamp): Fecha en que se generó la factura.
   - `total` (float): Total a pagar en la factura.
   - Representa las facturas generadas por la venta de productos a los clientes.
8. **despacho**:
   - `id` (text): Identificador único para cada despacho.
   - `fecha` (timestamp): Fecha en que se realizó el despacho.
   - `id_cliente` (text): Identificador del cliente al que se despacha.
   - `id_factura` (text): Identificador de la factura asociada al despacho.
   - Representa el evento de despacho de productos a los clientes.
9. **precio**:
   - `id` (text): Identificador único para cada precio.
   - `id_cultivo` (text): Identificador del tipo de cultivo.
   - `valor` (float): Precio por unidad del cultivo.
   - `fecha` (timestamp): Fecha en que se estableció el precio.
   - Representa el precio internacional de mercado establecido para cada tipo de cultivo en una fecha específica. Se da para el primer día de cada mes por cada cultivo y el precio es en dólares por kilogramo.

### Relaciones y Claves Foráneas

1. **lote**:

   - `lote.id_finca` referencia a `finca.id`: Establece la relación entre un lote y la finca a la que pertenece.
   - `lote.id_cultivo` referencia a `m_cultivo.id`: Establece la relación entre un lote y el tipo de cultivo que se cultiva en ese lote.

2. **recogida**:

   - `recogida.id_lote` referencia a `lote.id`: Relaciona una recogida con el lote donde se realizó.
   - `recogida.id_despacho` referencia a `despacho.id`: Relaciona una recogida con el despacho donde fue incluida.

3. **despacho**:

   - `despacho.id_cliente` referencia a `cliente.id`: Relaciona un despacho con el cliente al que se destinó.
   - `despacho.id_factura` referencia a `factura.id`: Relaciona un despacho con la factura correspondiente.

4. **precio**:
   - `precio.id_cultivo` referencia a `m_cultivo.id`: Relaciona un precio con el tipo de cultivo al que corresponde.

## Fuente de los datos

- [DDL](https://github.com/prevalentWare/prevalentu-sql-proyecto-final/blob/main/ddl.sql)
- [Usuarios](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/ER57cZ_zqpNMtMjhB0j7NgYBRf2Py2Cm_DqvpCuHSZFP_w?e=2oewfp)
- [Clientes](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/ETvBWFtF8vJBm1S7fLyrOmMBvGus_HyzKriLqe1Szc_47Q?e=WxZy9e)
- [Despachos](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/EZwEoFGadplDiRZ9jneeYvQBXfbgGSC68X-mcrkk-kjfpA?e=MhGZJV)
- [Facturas](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/EbrBG3CrmHdFgQ80m1BPtEEB8qtW86Ps_J_qOjuaiI3SkQ?e=UWKDAH)
- [Fincas](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/EQn_SpjXTulLsbBz2pLFI4YBD9WJ-V42nvQyQmq_QTx9FQ?e=0hKN5J)
- [Lotes](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/EXplgO-MOgdIvoQj3AxP0wkBJTKaV3j0ygUB3FCWCjsiAw?e=LqY5Ak)
- [Cultivos](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/EXrI_Ls-wupKjr5FD29VjJEBC8m1vy1UpOnYRkis4i4Now?e=FIeknX)
- [Precios](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/Eb60ZqannAJJryINzCEJD8MBf0ShoyD6HArldgfsgBxXeA?e=heXlOG)
- [Recogidas](https://prevalentware.sharepoint.com/:x:/s/PrevalentWareUniversity/EWip2acfPX1AqPsTJBQghbEBRUxJk2ckN1-W6xVSx8Atnw?e=Emjdfy)

## Evaluación

Una vez termines de importar tus datos, explora la información y la base de datos. Cuando te sientas en confianza, revisa las 27 preguntas que exponemos más abajo.

Dichas 27 preguntas serán evaluadas, y deberás ingresar las respuestas a cada una de estas preguntas en [este formulario](https://forms.office.com/r/CU5RKgwTrD).

Te recordamos que es necesario un puntaje de, al menos, 85% para pasar con éxito el curso. Adicionalmente, el formulario no calcula auotmáticamente tu nota. Una vez lo llenes, necesitaremos un tiempo para revisar tu evaluación.

Finalmente, recordamos que PrevalentU es un ejercicio académico compuesto por profesionales. Esperamos que este sea un trabajo honesto, individual y ejecutado 100% por tí.

### Queries generales (50%)

1. ¿Cuántos lotes hay en la finca "La Esperanza"?
2. ¿Cuál es el cultivo más recogido en la finca "El Encanto"?
3. ¿Cuál ha sido el total recolectado de palma africana en la finca "La Ilusión"?
4. ¿Cuál es el valor total de facturas emitidas en septiembre de 2023?
5. ¿Cuántos despachos se han hecho en la finca "La Prevalencia"?
6. ¿Cuál es el cliente que ha tenido más despachos?
7. ¿Cuántos kilogramos de arroz se han recolectado en total?
8. ¿Qué usuario ha participado en más recogidas?
9. ¿Cuál es el precio promedio por kilogramo de palma africana desde enero de 2021 hasta octubre de 2023?
10. ¿Cuál es el total de kilogramos recolectados en la finca "El Resguardo" durante el año 2022?
11. ¿Cuál es el cultivo que tuvo el precio más alto en enero de 2023?
12. ¿Cuál ha sido el valor total de las facturas del cliente "Cultivos y Semillas La Tierra" durante el año 2023?
13. ¿Cuántas recogidas se han realizado en la finca "La Esperanza" en el mes de mayo de 2021?
14. ¿Cuál es el total de kilogramos despachados por cada cliente en septiembre de 2022?
15. ¿Cuál es el usuario que ha realizado la recogida con la mayor cantidad de kilogramos en un solo día y cuánto recogió?
16. ¿Cuál es el total de peso recogido por cada finca en el año 2022?
17. ¿Cuál cliente ha tenido más despachos en el año 2023?
18. ¿Qué cultivo ha tenido la mayor variación en precio a lo largo del tiempo?
19. ¿Cuál es el top 3 de cultivos por la cantidad total recolectada desde enero de 2021 hasta octubre de 2023?
20. ¿Cuál es la recogida que presenta mayor diferencia vs el promedio de recogida de su lote?

### Vistas y funciones (20%)

21. Cree una vista llamada vista_resumen_recogida_cedula (por ejemplo, vista_resumen_recogida_1065377193), que contenga un resumen de la información de las recogidas por finca y por lote, incluyendo el total recogido y el promedio de recogida por día. La vista debe mostrar 4 columnas:

- nombre de la finca
- nombre del lote
- total recogido en ese lote en esa finca
- promedio recogido por día en ese lote en esa finca

22. Cree una función en SQL que permita calcular el total facturado por un cliente en un mes específico. La función se debe llamar calcular_total_facturado_cedula (por ejemplo calcular_total_facturado_1065377193), y debe recibir dos parámetros: la fecha inicial y la fecha final, ambos textos en formato yyyy-mm-dd.

La función debe devolver un query con 3 columnas:

- el id del cliente
- el nombre del cliente
- el total facturado en ese rango de fechas

### Optimización (20%)

23. Al DDL entregado le falta, a propósito, un foreign key. Analiza el Diagrama ER, identifica qué foreign key falta, y escribe a continuación el código para crear el foreign key faltante.
24. Haz tu mejor esfuerzo para que este query se ejecute lo más rápido posible, creando los índices que consideres necesarios.

```sql
select * from public.recogida r
where
r.fecha between '2023-01-01' and '2023-01-31'
and r.id_lote = '031c6579-d90e-4974-8263-6f47aecbe084'
```

25. Sube una captura de pantalla con el resultado de la ejecución del siguiente query

```sql
explain analyze
select * from public.recogida r
where
r.fecha between '2023-01-01' and '2023-01-31'
and r.id_lote = '031c6579-d90e-4974-8263-6f47aecbe084'
```

### Análisis propio (10%)

26. Explica con tus palabras las diferencias que hay entre un stored procedure y una función de SQL
27. Explica con tus palabras las diferencias que hay entre una vista y una vista materializada en SQL.
