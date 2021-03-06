import React, { PropTypes } from 'react';
import { Router, Route, IndexRoute } from 'react-router';
import {
  App,
  Order,
  OrderAdd,
  PromoList,
  ProductList,
  DishList,
  OrderPromoAdd,
  OrderProductAdd,
  OrderDishAdd,
  Product,
  Dish,
  Promo,
  ProductAdd,
  ProductEdit,
  DishAdd,
  DishEdit,
  PromoAdd,
  PromoEdit,
  Sector,
  Table,
  CommandViewer,
  Setting,
} from './containers';

const Routes = ({ history }) => (
  <Router history={history}>
    <Route name="App" path="/" component={App}>
      <Route name="Productos" path="producto">
        <IndexRoute component={Product} />
        <Route name="Add" path="add" component={ProductAdd} />
        <Route name="Edit" path="edit/:productId" component={ProductEdit} />
      </Route>
      <Route name="Platos" path="plato" >
        <IndexRoute component={Dish} />
        <Route name="Add" path="add" component={DishAdd} />
        <Route name="Edit" path="edit/:dishId" component={DishEdit} />
      </Route>
      <Route name="Promo" path="promo">
        <IndexRoute component={Promo} />
        <Route name="Add" path="add" component={PromoAdd} />
        <Route name="Edit" path="edit/:promoId" component={PromoEdit} />
      </Route>
      <Route name="Table" path="sector">
        <IndexRoute component={Sector} />
        <Route name="Pedido" path=":mesaId">
          <IndexRoute component={Table} />
          <Route path=":pedidoId">
            <IndexRoute component={OrderAdd} />
            <Route name="Comanda" path="comanda">
              <Route name="Promos" path="promos">
                <IndexRoute component={PromoList} />
                <Route name="Add" path=":promoId" component={OrderPromoAdd} />
              </Route>
              <Route name="Productos" path="productos">
                <IndexRoute component={ProductList} />
                <Route name="Add" path=":productId" component={OrderProductAdd} />
              </Route>
              <Route name="Platos" path="platos">
                <IndexRoute component={DishList} />
                <Route name="Add" path=":dishId" component={OrderDishAdd} />
              </Route>
            </Route>
          </Route>
        </Route>
      </Route>
      <Route name="Viewer" path="viewer" component={CommandViewer} />
      <Route name="Setting" path="setting" component={Setting} />
    </Route>
  </Router>
);

Routes.propTypes = {
  history: PropTypes.object,
};

export default Routes;
