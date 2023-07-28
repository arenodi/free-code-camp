import React from "react";
import { useState } from "react";

const QuoteGen = () => {
  const [quote, setQuote] = useState("Welcome to Random Quotes");
  const [author, setAuthor] = useState("Andre Alves");

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

  const twitterItent =
    "https://twitter.com/intent/tweet?text=" +
    encodeURIComponent('"' + quote + '" - ' + author) +
    "&hashtags=quotes";

  return (
    <div className="full-viewport">
      <div id="quote-box" className="quote-main">
        <div className="container-fluid">
          <div className="row justify-content-center">
            <div id="text" className="col align-self-center quote">
              <p className="text-center quote-text">
                <i className="fa-solid fa-quote-left double-quotes"></i>
                <span className="space-between">{quote}</span>
                <i className="fa-solid fa-quote-right double-quotes"></i>
              </p>
            </div>
          </div>
          <div className="row justify-content-end">
            <div id="author" className="col-8 align-self-center author">
              <p className="author-text">- {author}</p>
            </div>
          </div>
          <div className="row justify-content-between">
            <div className="col-4">
              <a
                href={twitterItent}
                rel="noreferrer"
                target="_blank"
                className="btn btn-block btn-primary float-start"
                id="tweet-quote"
                role="button"
              >
                <i className="fa-brands fa-twitter"></i>
              </a>
            </div>
            <div className="col-4">
              <button
                type="button"
                className="btn btn-block btn-primary float-end"
                onClick={handleClick}
                id="new-quote"
              >
                New
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default QuoteGen;
