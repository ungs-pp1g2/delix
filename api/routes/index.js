module.exports = (router, io) => {
  // require('./login')(router);
  // require('./promo')(router);
  require('./rubros')(router);
  require('./productos')(router);
  require('./franjas')(router);
  require('./platos')(router);
  require('./proveedores')(router);
  require('./sectores')(router);
  require('./pedidos')(router);
  require('./comandas')(router);
  require('./promos')(router);
};
