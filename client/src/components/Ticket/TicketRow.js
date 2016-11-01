import React, { PropTypes } from 'react';
import { Card, CardTitle } from 'material-ui/Card';
import { Grid, Row, Col } from 'react-flexbox-grid';
import Divider from 'material-ui/Divider';
import styles from './style.css';

const TicketRow = ({ ticket, onClick }) => (
  <Card className={styles.item} onClick={onClick ? () => onClick(ticket) : null}>
    <CardTitle
      title={ticket.grupoDeMesas.nombre}
      subtitle={`${ticket.usuario.nombre} ${ticket.usuario.apellido}`}
    />
    <Grid fluid>
      <Row className={styles.row}>
        <Col xs={6}>
          Descripcion
        </Col>
        <Col xs={2}>
          #
        </Col>
        <Col xs={2}>
          Precio
        </Col>
        <Col xs={2}>
          Total
        </Col>
      </Row>
      <Divider />
      {
        ticket.orderLines.map((orderLine, i) => (
          <Row key={i} className={styles.row}>
            <Col xs={6}>
              {orderLine.descripcion}
            </Col>
            <Col xs={2}>
              {orderLine.cantidad}
            </Col>
            <Col xs={2}>
              {`$${orderLine.precio}`}
            </Col>
            <Col xs={2}>
              {`$${orderLine.precioTotal}`}
            </Col>
          </Row>
        ))
      }
      <Divider />
      <Row center="xs">
        <Col xs>
          <CardTitle title={`$${ticket.total}`} />
        </Col>
      </Row>
    </Grid>
  </Card>
);

TicketRow.propTypes = {
  ticket: PropTypes.object,
  onClick: PropTypes.func,
};

export default TicketRow;
