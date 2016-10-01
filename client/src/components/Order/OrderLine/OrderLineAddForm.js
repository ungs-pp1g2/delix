import React, { PropTypes } from 'react';
import { Card, CardText, CardActions } from 'material-ui/Card';
import { Grid, Row, Col } from 'react-flexbox-grid';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';

class OrderLineAddForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      quantity: 0,
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSave = this.handleSave.bind(this);
  }

  handleChange(e) {
    const quantity = parseInt(e.target.value || 0, 10);
    this.setState({ quantity });
  }

  handleSave() {
    this.props.onSave(this.state.quantity);
  }

  render() {
    const { text } = this.props;
    return (
      <Card>
        <CardText>
          <Grid fluid>
            <Row>
              <Col xs>
                {text}
              </Col>
              <Col xs>
                <TextField
                  type="number"
                  hintText="Cantidad"
                  value={this.state.quantity}
                  onChange={this.handleChange}
                />
              </Col>
            </Row>
          </Grid>
        </CardText>
        <CardActions>
          <Grid fluid>
            <Row>
              <Col xs>
                <RaisedButton label="Agregar" onTouchTap={this.handleSave} />
              </Col>
            </Row>
          </Grid>
        </CardActions>
      </Card>
  );
  }

}

OrderLineAddForm.propTypes = {
  text: PropTypes.string,
  onSave: PropTypes.func,
};

export default OrderLineAddForm;