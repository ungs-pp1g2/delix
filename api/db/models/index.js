module.exports = (sequelize, DataTypes) => ({
  comandas: require('./comandas')(sequelize, DataTypes),
  franjas: require('./franjas')(sequelize, DataTypes),
  grupoDeMesas: require('./grupo_de_mesas')(sequelize, DataTypes),
  mesas: require('./mesas')(sequelize, DataTypes),
  mesas: require('./mesas')(sequelize, DataTypes),
  pedidoEstado: require('./pedido_estado')(sequelize, DataTypes),
  pedidos: require('./pedidos')(sequelize, DataTypes),
  platosPorComandas: require('./platos_por_comandas')(sequelize, DataTypes),
  platosPorPromos: require('./platos_por_promos')(sequelize, DataTypes),
  platos: require('./platos')(sequelize, DataTypes),
  productosPorComandas: require('./productos_por_comandas')(sequelize, DataTypes),
  productosPorPromos: require('./productos_por_promos')(sequelize, DataTypes),
  productosPorRecepciones: require('./productos_por_recepciones')(sequelize, DataTypes),
  productosPorRubros: require('./productos_por_rubros')(sequelize, DataTypes),
  productosPorSolicitudes: require('./productos_por_solicitudes')(sequelize, DataTypes),
  productos: require('./productos')(sequelize, DataTypes),
  promosPorComandas: require('./promos_por_comandas')(sequelize, DataTypes),
  promos: require('./promos')(sequelize, DataTypes),
  proveedores: require('./proveedores')(sequelize, DataTypes),
  recepciones: require('./recepciones')(sequelize, DataTypes),
  reservas: require('./reservas')(sequelize, DataTypes),
  rubrosPorProveedor: require('./rubros_por_proveedor')(sequelize, DataTypes),
  rubros: require('./rubros')(sequelize, DataTypes),
  sectores: require('./sectores')(sequelize, DataTypes),
  solicitudes: require('./solicitudes')(sequelize, DataTypes),
  usuarioTipo: require('./usuario_tipo')(sequelize, DataTypes),
  usuarios: require('./usuarios')(sequelize, DataTypes),
})