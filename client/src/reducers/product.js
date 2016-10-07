import {
  GET_PRODUCTS,
  GET_PRODUCT,
  SET_PRODUCT,
  DELETE_PRODUCT,
  FILTER_PRODUCTS,
} from '../constants';

import { handleActions } from 'redux-actions';
const initialState = {
  selected: null,
  all: [],
  list: [],
  current: null,
};

const filter = (f, all) =>
  all.filter(s => s.descripcion.toLowerCase().indexOf(f.toLowerCase()) !== -1);

export default handleActions({
  [GET_PRODUCTS]: (state, { payload }) => ({ ...state, all: payload, list: payload }),
  [GET_PRODUCT]: (state, { payload }) => ({ ...state, current: payload }),
  [DELETE_PRODUCT]: (state, { payload }) => (
    {
      ...state,
      all: state.all.filter(x => x.id !== payload),
      list: state.list.filter(x => x.id !== payload),
    }
  ),
  [FILTER_PRODUCTS]: (state, { payload }) => (
    {
      ...state,
      list: filter(payload, state.all),
    }
  ),
  [SET_PRODUCT]: (state, { payload }) => (
    {
      ...state,
      selected: payload,
    }
  ),
}, initialState);
