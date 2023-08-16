import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";

const dataUrl =
  "https://raw.githubusercontent.com/freeCodeCamp/ProjectReferenceData/master/GDP-data.json";

const getData = (callback) => {
  fetch(dataUrl)
    .then((response) => response.json())
    .then((data) => {
      let dateSet = data.data.map((item) => item[0]);
      let dataSet = data.data.map((item) => item[1]);
      let yearsText = data.data.map((item) => {
        let quarter;
        switch (item[0].substring(5, 7)) {
          case "01":
            quarter = "Q1";
            return item[0].substring(0, 4) + " " + quarter;
          case "04":
            quarter = "Q2";
            return item[0].substring(0, 4) + " " + quarter;
          case "07":
            quarter = "Q3";
            return item[0].substring(0, 4) + " " + quarter;
          case "10":
            quarter = "Q4";
            return item[0].substring(0, 4) + " " + quarter;
          default:
            return item[0].substring(0, 4);
        }
      });

      console.log(dateSet);
      console.log(dataSet);
      console.log(yearsText);
      callback(dateSet, dataSet, yearsText);
    });
};

const generateChart = (xAxisData, yAxisData, xAxisText) => {
  // Declare the chart dimensions and margins.
  const width = 860;
  const height = 400;
  const marginTop = 20;
  const marginRight = 20;
  const marginBottom = 30;
  const marginLeft = 40;
  const barWidth = width / xAxisData.length;
  // Get min and max for years
  const minYear = d3.min(xAxisData, (date) => new Date(date));
  const maxYear = new Date(
    String(d3.max(xAxisData, (date) => new Date(date)).getFullYear() + 1)
  );
  const minGdp = d3.min(yAxisData);
  const maxGdp = d3.max(yAxisData);

  console.log(minYear, maxYear, minGdp, maxGdp);

  const tooltip = d3
    .select("#chart-holder")
    .append("div")
    .style("position", "absolute")
    .style("z-index", "10")
    .style("visibility", "hidden")
    .style("width", "200px")
    .style("height", "50px")
    .style("background", "rgba(166, 166, 166, 0.9)")
    .style("display", "flex")
    .style("flex-flow", "row wrap")
    .style("align-items", "center")
    .style("justify-content", "center")
    .style("font-family", "Verdana, sans-serif")
    .text("a simple tooltip");

  const reference = d3
    .select("#chart-holder")
    .append("div")
    .attr("class", "reference")
    .style("opacity", 0);

  // Declare the x (horizontal position) scale.
  const x = d3
    .scaleUtc()
    .domain([new Date(minYear), new Date(maxYear)])
    .range([marginLeft, width - marginRight]);

  // Declare the y (vertical position) scale.
  const y = d3
    .scaleLinear()
    .domain([0, maxGdp])
    .range([height - marginBottom, marginTop]);

  // Create the SVG container.
  const svg = d3
    .select("#chart-holder")
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  // Add the x-axis.
  svg
    .append("g")
    .attr("transform", `translate(0,${height - marginBottom})`)
    .attr("class", "x-axis")
    .call(d3.axisBottom(x));

  // Add the y-axis.
  svg
    .append("g")
    .attr("transform", `translate(${marginLeft},0)`)
    .attr("class", "y-axis")
    .call(d3.axisLeft(y));

  svg
    .append("text")
    .attr("transform", "rotate(-90)")
    .attr("x", -(height / 2 + marginBottom))
    .attr("y", marginLeft + 20)
    .text("Gross Domestic Product");

  svg
    .selectAll("rect")
    .data(yAxisData)
    .enter()
    .append("rect")
    .attr("class", "bar")
    .attr("fill", "#143a5c")
    .attr("data-date", (d, i) => xAxisData[i])
    .attr("data-gdp", (d, i) => d)
    .attr("index", (d, i) => i)
    .attr("x", (d, i) => x(new Date(xAxisData[i])))
    .attr("y", (d, i) => y(d))
    .attr("width", barWidth)
    .attr("height", (d, i) => height - y(d) - marginBottom)
    .on("mouseover", function (event, d) {
      const posY = d3.select(this).attr("y");
      const posX = d3.select(this).attr("x");
      const i = d3.select(this).attr("index");
      d3.select(this).attr("fill", "#80baed");
      tooltip
        .style("top", height - marginBottom + "px")
        .style("left", posX + "px")
        .text(xAxisText[i] + "\n$ " + d);
      return tooltip.style("visibility", "visible");
    })
    .on("mouseout", function () {
      d3.select(this).attr("fill", "#143a5c");
      return tooltip.style("visibility", "hidden");
    });
};

getData(generateChart);
