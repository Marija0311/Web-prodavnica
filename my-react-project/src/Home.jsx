import React from "react";

const Home = () => {
  return (
    <div className="home">
      <img src="https://news.okstate.edu/articles/agriculture/images/shopping_cart_banner.jpg" alt="Web prodavnica" />
      <div className="home-text">
        <h1>Dobrodošli na web prodavnicu</h1>
        <p>
        Ovo je prva web prodavnica u Srbiji sa najboljim i najkvalitetnijim
        proizvodima. Naša isporuka je brza i pouzdana, a plaćanje je moguće
        karticom ili pouzećem. Uverite se u kvalitet naših proizvoda i ugodno kupovinu!
        </p>
        <p>
        Naša online prodavnica nudi širok asortiman proizvoda, od svežeg voća i
        povrća, preko mesnih i mlečnih proizvoda, do raznih vrsta peciva,
        kolača i slatkiša. Osim toga, kod nas možete pronaći i organske i
        lokalne proizvode, kao i egzotične ukuse iz celog sveta.
        </p>
      </div>
    </div>
  );
};

export default Home;
