import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';
import CheckoutForm from './checkout-form';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'vinyl',
        params: {}
      },
      cart: [],
      products: []
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
    this.deleteCartItem = this.deleteCartItem.bind(this);
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    }, () => this.getProducts(this.state.view.name));
  }

  getProducts(category) {
    fetch(`/api/products/all/${category}`)
      .then(results => results.json())
      .then(data => this.setState({ products: data }))
      .catch(err => console.error(err));
  }

  checkForCurrentPage() {
    if (this.state.view.name === 'details') {
      return <ProductDetails productId={this.state.view.params.productId} setView={this.setView} addToCart={this.addToCart} />;
    } else if (this.state.view.name === 'cart') {
      return <CartSummary products={this.state.cart} setView={this.setView} deleteCartItem={this.deleteCartItem} />;
    } else if (this.state.view.name === 'checkout') {
      return <CheckoutForm products={this.state.cart} setView={this.setView} placeOrder={this.placeOrder} />;
    } else {
      return <ProductList products={this.state.products} view={this.state.view.name} setView={this.setView} addToCart={this.addToCart} />;
    }
  }

  getCartItems() {
    fetch('/api/cart')
      .then(result => result.json())
      .then(data => this.setState({ cart: data }));
  }

  addToCart(product) {
    fetch(`/api/cart/${product.productId}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(product)
    })
      .then(result => result.json())
      .then(data => {
        const newList = this.state.cart;
        newList.push(data);
        this.setState({ cart: newList });
      });
  }

  deleteCartItem(cartItemId) {
    fetch(`/api/cart/${cartItemId}`, {
      method: 'DELETE'
    })
      .then(() => {
        const newList = this.state.cart.filter(cartItem => cartItem.cartItemId !== cartItemId);
        this.setState({ cart: newList });
      });
  }

  placeOrder(customerInfo) {
    fetch('/api/orders/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(customerInfo)
    })
      .then(data => {
        this.setState({
          view: {
            name: 'vinyl',
            params: {}
          },
          cart: []
        });
      });
  }

  componentDidMount() {
    this.getProducts('vinyl');
    this.getCartItems();
  }

  render() {
    return (
      <div className="container-fluid">
        <header className="row sticky-top bg-light shadow-sm">
          <Header numberInCart={this.state.cart.length} setView={this.setView} />
        </header>
        <div className="row">
          <div className="container my-3">
            <div className="row">
              { this.checkForCurrentPage() }
            </div>
          </div>
        </div>
      </div>
    );
  }
}
