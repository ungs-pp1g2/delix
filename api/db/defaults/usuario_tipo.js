module.exports = ({ usuarioTipo }) => {
  usuarioTipo.upsert({ id: 1, descripcion: 'Encargado' });
  usuarioTipo.upsert({ id: 2, descripcion: 'Mozo' });
  usuarioTipo.upsert({ id: 3, descripcion: 'Cocinero' });
}
