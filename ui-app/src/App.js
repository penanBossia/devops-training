import React, { useState, useEffect } from 'react';
import './App.css';


function App() {
  const [products, setProducts] = useState([]);
  const [payments, setPayments] = useState([]);

  useEffect(() => {
    fetch('javaapi/v1/products')
    .then(resp => resp.json())
    .then(json => setProducts(json))
    .catch(error => console.log(error))
  }, []);

  useEffect(() => {
    fetch('pythonapi/v1/payments')
    .then(resp => resp.json())
    .then(json => setPayments(json))
    .catch(error => console.log(error))
  }, []);

  console.log("toto");

  const lisProducts = products.map(product => 
    <li>{product.id} - {product.title}</li>
  );

  const listPayments = payments.map(payment => 
    <li>{payment.id} - {payment.description} : {payment.amount}</li>
  );

  return (
    <div>
      <div>
        <ul>{lisProducts}</ul>
      </div>

      <div>
        <ul>{listPayments}</ul>
      </div>
    </div>
    
  );
}

export default App;
