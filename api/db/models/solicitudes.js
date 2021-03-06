/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('solicitudes', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    }
  }, {
    tableName: 'solicitudes',
    name: {
      singular: 'solicitud',
      plural: 'solicitudes',
    },
    paranoid: true,
  });
};
