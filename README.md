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

### Geometric Brownian Motion (GBM):
Stock price prediction techniques have seen many growth, challenges and changes over long-time where each model proposes a different approach to solve in hand challenges. Two common techniques to analyse the stock data are qualitative and quantitative (technical and fundamental) where qualitative techniques focus on experience of experts to predict outcomes and quantitative techniques focus on historical/past data to predict the patterns and behaviour that tend to recur in coming future (Fama, 1995; Nelson, 1995; Reddy and Clinton, 2016; Badriah and Nazifah, 2018). Stock prices exhibit unpredictable and random behaviour, a random walk theory, hence cannot exclude the risk while predicting the stock price at given period (Fama, 1995; Shamiri and Isa, 2010; Maruddani and Trimono, 2018).

*(Note: In this analysis, financial year 1st July 2017 to 30th June 2018 has been considered and there were approximately 249 working/trading days)*

**Geometric Brownian Motion (GBM):** The Geometric Brownian Motion is most suitable to describe the behaviours of timeseries data and in this scenario, it helps with the random or unpredictable behaviours of stock prices with keeping track of stock volatility and drift (Dmouj, 2006; Shamiri and Isa, 2010; Reddy and Clinton, 2016).
A simplified version of GBM is as follows:

![Image-1](/Images/Image1.png)

**Volatility:** The volatility, an annual percentage, denotes the stability (constant characteristic) of stock price where high value means high or constant variation during large interval whereas medium and low value means medium or less variations in given interval (Dmouj, 2006; Shamiri and Isa, 2010). Usually, volatility is measured by the standard deviation of the price returns however more practical approach is to observe past data for fixed timeframe (Dmouj, 2006; Badriah and Nazifah, 2018).
A simplified version of GBM is as follows:

![Image-2](/Images/Image2.png)

**Drift:** The drift rate, an average rate of return where price of shares changes in given period, can be obtained as follows:

![Image-3](/Images/Image3.png)

### Data Distribution:
To use Geometric Brownian Motion effectively (Sengupta, 2004),
- Continuous stock prices in terms of time and value
- Proportional return of share prices needs to be log-normally distributed
- Normal distribution of continuous compounded return for a stock

Hence keeping these in mind,
Distribution of daily return obtained using the formula follows: 
Daily Return: 𝑅𝑖 = (𝑆𝑖 − 𝑆𝑖−1)/𝑆𝑖−1
