# Share Price Analysis and Predictions using [R](/Program.R) and [Microsoft Excel](/Calculation.xlsx)

A Case study to analyse share price of an organization (AGL Energy Limited - AGL.AX) and predicting stock prices for a given date using Geometric Brownian Motion (GBM).

In this analysis, three months (1st March'2018 to 31st May'2018) of stock price data were taken to train the model from [Yahoo Finance Australia](https://au.finance.yahoo.com/quote/AGL.AX?p=AGL.AX&.tsrc=fin-srch) and predicted stock price on 15th June'2018.

### AGL Energy Limited - Principle Activities:
- Three strategic priorities: growth, transformation and social licence
- Operates Australia’s largest electricity generation portfolio
- Focuses on sustainable energy solutions
- Largest investor in renewable energy with approximately 3.6 million customer accounts
- Secure and affordable energy to households and business
- Prospering carbon-constrained world (targeting to exit coal-fired electricity generation by next 30 years) and building customer advocacy
- Help vulnerable customers (plan to invest 6.5 million over next three years)
- Promoting to have social and economically inclusive societies (as they are happier, healthier and more productive)
- Committed to achieve excellence in environmental management and performance

### General Trend of Data:
Company’s share price behaviour and performance (Day vs Closing Price) is shown below in graph 1 (line) & 2 (candlestick) during Mar’18 to May’18. It is clearly visible that there was no certain trend in data during the given period. From March to beginning of April, closing prices were distributed between 21 to 22 AUD however there was huge fall in share price during mid of April though sudden growth can be seen till start of May and prices were distributed around 22 AUD till end of May.

![Graph-1](/Images/LineGraph_Overview.png)

The graph 2 is candlestick graph. This graph, a Japanese Candlestick Graph, is widely used to represent the stock data as it shows Open, Close, Low and High values of a stock for a day however it is good to use this graph for short period of data as it might cause information overload to people with less knowledge. Also, colours can also suggest about the growth in share price or not hence it is easy to visualise multiple values/data at a same time.

![Graph-2](/Images/CandlestickGraph_Overview.png)

