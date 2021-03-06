/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('pagos', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    pedidoId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'pedidos',
        key: 'id'
      }
    }
  }, {
    tableName: 'pagos',
    name: {
      singular: 'pago',
      plural: 'pagos',
    },
    paranoid: true,
  });
};
