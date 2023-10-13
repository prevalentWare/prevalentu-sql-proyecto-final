
CREATE TABLE public.cliente (
	id text NOT NULL,
	nombre text NOT NULL,
	CONSTRAINT cliente_pkey PRIMARY KEY (id)
);


CREATE TABLE public.factura (
	id text NOT NULL,
	fecha timestamp(3) NOT NULL,
	total float8 NOT NULL DEFAULT 0,
	CONSTRAINT factura_pkey PRIMARY KEY (id)
);


CREATE TABLE public.finca (
	id text NOT NULL,
	nombre text NOT NULL,
	CONSTRAINT finca_pkey PRIMARY KEY (id)
);


CREATE TABLE public.m_cultivo (
	id text NOT NULL,
	nombre text NOT NULL,
	CONSTRAINT m_cultivo_pkey PRIMARY KEY (id)
);

CREATE TABLE public.usuario (
	id text NOT NULL,
	nombre text NOT NULL,
	correo text NOT NULL,
	CONSTRAINT usuario_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX usuario_correo_key ON public.usuario USING btree (correo);


CREATE TABLE public.despacho (
	id text NOT NULL,
	fecha timestamp(3) NOT NULL,
	id_cliente text NOT NULL,
	id_factura text NULL,
	CONSTRAINT despacho_pkey PRIMARY KEY (id),
	CONSTRAINT despacho_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT despacho_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id) ON DELETE SET NULL ON UPDATE CASCADE
);



CREATE TABLE public.lote (
	id text NOT NULL,
	nombre text NOT NULL,
	id_finca text NOT NULL,
	id_cultivo text NOT NULL,
	CONSTRAINT lote_pkey PRIMARY KEY (id),
	CONSTRAINT lote_id_cultivo_fkey FOREIGN KEY (id_cultivo) REFERENCES public.m_cultivo(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT lote_id_finca_fkey FOREIGN KEY (id_finca) REFERENCES public.finca(id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE public.precio (
	id text NOT NULL,
	id_cultivo text NOT NULL,
	valor float8 NOT NULL,
	fecha timestamp(3) NOT NULL,
	CONSTRAINT precio_pkey PRIMARY KEY (id),
	CONSTRAINT precio_id_cultivo_fkey FOREIGN KEY (id_cultivo) REFERENCES public.m_cultivo(id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE public.recogida (
	id text NOT NULL,
	fecha timestamp(3) NOT NULL,
	id_lote text NOT NULL,
	cantidad float8 NOT NULL,
	id_usuario text NOT NULL,
	id_despacho text NULL,
	CONSTRAINT recogida_pkey PRIMARY KEY (id),
	CONSTRAINT recogida_id_despacho_fkey FOREIGN KEY (id_despacho) REFERENCES public.despacho(id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT recogida_id_lote_fkey FOREIGN KEY (id_lote) REFERENCES public.lote(id) ON DELETE RESTRICT ON UPDATE CASCADES
);
