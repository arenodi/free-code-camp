import React, { useState, useEffect } from "react";

const Quotes = () => {
  const [quote, setQuote] = useState("");
  const [author, setAuthor] = useState("");

  useEffect(() => {
    getQuote();
  }, []);

  const getQuote = () => {
    const url = "https://dummyjson.com/quotes/random";
    fetch(url)
      .then((res) => res.json())
      .then((data) => {
        setQuote(data.quote);
        setAuthor(data.author);
      });
  };

  const handleClick = () => {
    getQuote();
  };

  return (
    <div id="quote-box">
      <div id="text">
        <p>{quote}</p>
      </div>
      <div id="author">
        <p>{author}</p>
      </div>

      <div id="buttons">
        <div className="social-media">
          <a href="twitter.com/intent/tweet" id="tweet-quote">
            <span>
              <img src="" alt="" />
            </span>
          </a>
        </div>
        <button onClick={handleClick} id="new-quote">
          New Quote
        </button>
      </div>
    </div>
  );
};

export default Quotes;
