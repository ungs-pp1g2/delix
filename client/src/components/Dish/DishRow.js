import React, { PropTypes } from 'react';
import { ListItem } from 'material-ui/List';
import { Grid, Row, Col } from 'react-flexbox-grid';

const DishRow = ({ dish, onClick, disabled, menu }) => (
  <ListItem disabled={disabled} innerDivStyle={{ padding: 'initial' }}>
    <Grid onClick={onClick ? () => onClick(dish) : null}>
      <Row>
        <Col xs={9}>
          <ListItem
            disabled
            primaryText={dish.nombre}
            secondaryText={dish.descripcion}
          />
        </Col>
        <Col xs={3}>
          <ListItem
            disabled
            primaryText={`$${dish.precio}`}
            rightIconButton={menu}
          />
        </Col>
      </Row>
    </Grid>
  </ListItem>
);

DishRow.propTypes = {
  dish: PropTypes.object,
  onClick: PropTypes.func,
  disabled: PropTypes.bool,
  menu: PropTypes.any,
};

export default DishRow;
