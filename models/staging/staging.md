{% docs staging_tpch_source %}
Los datos de esta capa provienen directamente del dataset de ejemplo de **Snowflake**, en concreto de TPCH_SF1 (`SNOWFLAKE_SAMPLE_DATA`).
El objetivo principal de esta capa es:
* **Renombrar** columnas a un estándar legible.
* **Castear** tipos de datos (dates, decimals).
* **Limpiar** registros nulos o inconsistentes.

{% enddocs %}

{% docs stg_tpch_orders %}
Este modelo limpia la tabla bruta de órdenes. 
Se han transformado las claves de estado (`O`, `F`, `P`) para que sean legibles y se ha asegurado que el `total_price` sea siempre un valor decimal positivo.
{% enddocs %}