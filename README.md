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

![Graph-3](/Images/Daily_Return_Distribution.png)

As per graph 3, it is visible that data is slightly right-skewed hence we need to confirm that if data can be assumed as normally distributed or not. Hence, will use Shapiro-Wilk test of normality to determine that the data can be taken for further analysis or not.

The received result of Shapiro-Wilk test using R is as follows:
*W = 0.97805 and p-value = 0.3308*
Here, received p-value is greater than 0.05 that implies the distribution of the data is not significantly different from normally distributed data hence can be considered normally distributed.

### Volatility and Drift calculation and values - Daily and Annualised
![Image-4](/Images/Image4.png)

The above table shows the values (𝜎, 𝜇) obtained from 3 months data and 1 month’s data. Above mentioned Formulas for Volatility and Drift are used in calculation for daily and annualised foresight calculations where appropriate values of m has been used to calculate the scores. It is clearly visible that with changes in days/time there is effect on the values of both volatility and drift. It is noticeable that there is decrease in the values of sigma when the sample size is reduced hence we can assume that the model performance might get reduced as it won’t be able to track variations accurately compared to the model trained with 3 months sample size. Mixed effect can be observed in the values of drift where there is increase in value of daily return however decrease in annual return values. Theoretically, there should be decrease in the accuracy of the model when the sample size is decreased however we will look at the model performance using sigma and mu values obtained from both the model in next question.

### Prediction:
![Image-5](/Images/Image5.png)

The above table shows 10 days of share price prediction till 15th June 2018 where performance of model trained with 3 months of historical data seem to be performing better compared to model trained with only 1-month data however the difference in MAPE score is not too wide and as per the score results, we can denote that the model is highly accurate to predict the share price whether it is based on 3 months data or only 1 month’s data.
Here MAPE (Mean Absolute Percentage Error) score, widely use to evaluate algorithm performance, has been used to measure the forecast prediction accuracy which can be obtained using below formula:

Absolute Percentage Error (APE): 𝜀1 = |(𝐴𝑐𝑡𝑢𝑎𝑙−𝐹𝑜𝑟𝑒𝑐𝑎𝑠𝑡)/𝐴𝑐𝑡𝑢𝑎𝑙| × 100%

Using above formula, MAPE: 𝜖 = 𝜀1/𝑛 where n is number of forecast

### Company's Performance Summary:
AGL Energy Limited used to be above neutral to outperform category stock however during April’18, it is noticeable that there was a sudden fall in share price and the reason turned out to be that the competitors used to provide more offers that were below market prices in exchange for larger and longer contracts. Their Liddell power plant project also got rejected hence during the April there were noticeable changes in share price data. Because of the sudden changes in share price, the drift rate and volatility rate were affected hence the annual return of the company and performance decreased at some extent.

The performance of the model based on input data (3 months) considered was very accurate hence it helps to foresight short-term very accurately, with around only 4 percent of error, however we cannot denote anything about long-term foresight because it wasn’t analysed during this evaluation (Dmouj, 2006). The model should be normally distributed and that’s the basic criteria to apply GBM however in real world, all the stock prices are timeseries data hence it’s hard to find perfect bell curve in data hence other measures to check the normality of the data is required. In this model, Shapiro-Wilk test has been used where the value of p should be greater than 0.05.

### Bibliography:
Badriah, N. A. and Nazifah, S. (2018) ‘SCIENCE & TECHNOLOGY Forecasting Share Prices Accurately For One Month Using Geometric Brownian Motion’, 26(4), pp. 1619–1635.

Dmouj, A. (2006) ‘Stock price modelling : Theory and Practice’, Masters Degree Thesis, Vrije Universiteit.

Fama, E. F. (1995) ‘Random Walks in Stock Market Prices’, Financial Analysts Journal, 51(1), pp. 75– 80. doi: 10.2469/faj.v51.n1.1861.

Maruddani and Trimono (2018) ‘Stock price prediction using geometric Brownian motion Related content Modeling stock prices in a portfolio using multidimensional geometric brownian motion Stock price prediction using geometric Brownian motion’, J. Phys, p. 12047. doi: 10.1088/1742- 6596/974/1/012047.

Nelson, B. L. (1995) Stochastic modeling : analysis and simulation. McGraw-Hill (McGraw-Hill series in industrial engineering and management science). Available at: http://ezproxy.deakin.edu.au/login?url=http://search.ebscohost.com/login.aspx?direct=true&db=ca t00097a&AN=deakin.b1782173&site=eds-live&scope=site.

Reddy, K. and Clinton, V. (2016) ‘Simulating Stock Prices Using Geometric Brownian Motion: Evidence from Australian Companies’, Australasian Accounting, Business and Finance Journal, 10(3), pp. 23–47. doi: 10.14453/aabfj.v10i3.3.

Shamiri, A. and Isa, Z. (2010) ‘Modeling and Forecasting Volatility of the Malaysian Stock Markets’, Journal of Mathematics and Statistics, 5(3), pp. 234–240. doi: 10.3844/jmssp.2009.234.240.

Sengupta, C. (2004). Financial modelling using Excel and VBA. New Jersey, United States: John Wiley & Sons.