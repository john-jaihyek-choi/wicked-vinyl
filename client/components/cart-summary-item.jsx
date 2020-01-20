import React from 'react';

function Vinyl(props) {
  return (
    <>
      <strong className="card-title">{props.product.album}</strong>
      <div className="card-text">{props.product.artist}</div>
    </>
  );
}

function Turntable(props) {
  return (
    <>
      <strong className="card-title">{props.product.name} - {props.product.color}</strong>
      <div className="card-text">{props.product.brand}</div>
    </>
  );
}

function Accessory(props) {
  return (
    <>
      <strong className="card-title">{props.product.name}</strong>
      <div className="card-text">{props.product.brand}</div>
    </>
  );
}

function CartSummaryItem(props) {
  const category = props.product.category === 'vinyl' ? <Vinyl product={props.product} /> : props.product.category === 'turntable' ? <Turntable product={props.product} /> : <Accessory product={props.product} />;
  const price = `$${(props.product.price / 100).toFixed(2)}`;
  return (
    <div className="card p-3">
      <div className="row">
        <img className="shadow-sm cart-album-art mx-lg-4 mx-auto" src={props.product.albumArt} alt={props.product.album} />
        <div className="col-sm-12 col-lg-4 text-center text-lg-left">
          {category}
          <div className="card-subtitle text-muted">{price}</div>
        </div>
        <button className="btn btn-danger float-right my-auto" onClick={() => props.deleteCartItem(props.product.cartItemId)} >Delete</button>
      </div>
    </div>
  );
}

export default CartSummaryItem;
