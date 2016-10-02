import React, { PropTypes } from 'react';
import ProductAddForm from '../components/Product/ProductAddForm';
import * as actions from '../actions/product';
import { connect } from 'react-redux';

class ProductAdd extends React.Component {

  render() {
    return (
      <ProductAddForm onSave={this.props.addProduct} />
    );
  }

}

ProductAdd.propTypes = {
  addProduct: PropTypes.func,
};

export default connect(null, { ...actions })(ProductAdd);
