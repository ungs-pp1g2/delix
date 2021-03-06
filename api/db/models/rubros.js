/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('rubros', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    descripcion: {
      type: DataTypes.STRING,
      allowNull: true
    }
  }, {
    tableName: 'rubros',
    name: {
      singular: 'rubro',
      plural: 'rubros',
    },
    paranoid: true,
  });
};
