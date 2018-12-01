#Final Project Data Exploration

setwd('C:/Users/mpeng/Documents/Mary/Georgetown/Math 645 Time Series/Final Project')
data <- data.frame(readxl::read_xlsx(path='Data.xlsx', sheet='All Data', col_names = TRUE))
colnames(data) <- c('date', 'year', 'month', 'cc_us', 'epu_us', 'cpi_us', 'ur_us', 'cc_uk', 'epu_uk',
                    'cpi_uk', 'ur_uk')
attach(data)

#Initial data exploration
cc_us.ts <- ts(cc_us, start=c(1998,1), freq=12)
cc_uk.ts <- ts(cc_uk, start=c(1998,1), freq=12)
epu_us.ts <- ts(epu_us, start=c(1998,1), freq=12)
epu_uk.ts <- ts(epu_uk, start=c(1998,1), freq=12)
cpi_uk.ts <- ts(cpi_uk, start=c(1998,1), freq=12)
cpi_us.ts <- ts(cpi_us, start=c(1998,1), freq=12)
ur_uk.ts <- ts(ur_uk, start=c(1998,1), freq=12)
ur_us.ts <- ts(ur_us, start=c(1998,1), freq=12)

#Consumer Confidence in U.S. vs. UK over time
plot(cc_us.ts, ylim=c(min(cc_us.ts, cc_uk.ts), max(cc_us.ts, cc_uk.ts)), ylab = 'OECD Consumer Confidence Index',
     main='Consumer Confidence Index in US vs. UK')
lines(cc_uk.ts, col='blue')
legend(x=1998, y=96,legend=c('US', 'UK'), col = c('black','blue'), lty=1:2, cex=0.6)

  #Observations: big drop in CC immediately after financial crisis
  #Drop in consumer confidence in the UK in 2016, but not in the U.S.in 2016
  #On average, the British have higher consumer confidence than Americans

#Plot the independent variables

#One version: plotting the US vs. UK
#Political Uncertainty Index
plot(epu_us.ts, ylim=c(min(epu_us.ts, epu_uk.ts), max(epu_us.ts, epu_uk.ts)), ylab = 'Political Uncertainty Index',
     main='Political Uncertainty Index in US vs. UK')
lines(epu_uk.ts, col='blue')
legend(x=1998, y=370,legend=c('US', 'UK'), col = c('black','blue'), lty=1:2, cex=0.6)

#CPI
plot(cpi_us.ts, ylim=c(min(cpi_us.ts, cpi_uk.ts), max(cpi_us.ts, cpi_uk.ts)), ylab = 'CPI: Inflation',
     main='CPI (Inflation) in US vs. UK')
lines(cpi_uk.ts, col='blue')
legend(x=1998, y=370,legend=c('US', 'UK'), col = c('black','blue'), lty=1:2, cex=0.6)

#Unemployment Rate
plot(ur_us.ts, ylim=c(min(ur_us.ts, ur_uk.ts), max(ur_us.ts, ur_uk.ts)), ylab = 'Unemployment Rate',
     main='Unemployment Rate in US vs. UK')
lines(ur_uk.ts, col='blue')
legend(x=1998, y=370,legend=c('US', 'UK'), col = c('black','blue'), lty=1:2, cex=0.6)

#Another version: plot the independent variables with the dependent variables all together
dev.new()

par(mfrow=c(2,2))

#US
plot(cc_us.ts, ylab = 'Consumer Confidence Index', ylim=c(min(cc_us.ts, cc_uk.ts), max(cc_us.ts, cc_uk.ts)),
     main='Consumer Confidence Index in US')

plot(cpi_us.ts, ylab = 'CPI',ylim=c(min(cpi_us.ts, cpi_uk.ts), max(cpi_us.ts, cpi_uk.ts)),
     main='Inflation (CPI) in US')

plot(epu_us.ts, ylab = 'Political Uncertainty Index',ylim=c(min(epu_us.ts, epu_uk.ts), max(epu_us.ts, epu_uk.ts)),
     main='Political Uncertainty Index in US')

plot(ur_us.ts, ylab = 'Unemployment Rate',  ylim=c(min(ur_us.ts, ur_uk.ts), max(ur_us.ts, ur_uk.ts)),
     main='Unemployment Rate in US')

#UK
plot(cc_uk.ts, ylab = 'Consumer Confidence Index',ylim=c(min(cc_us.ts, cc_uk.ts), max(cc_us.ts, cc_uk.ts)),
     main='Consumer Confidence Index in UK')

plot(cpi_uk.ts, ylab = 'CPI',ylim=c(min(cpi_us.ts, cpi_uk.ts), max(cpi_us.ts, cpi_uk.ts)),
     main='Inflation (CPI) in UK')

plot(epu_uk.ts, ylab = 'Political Uncertainty Index',ylim=c(min(epu_us.ts, epu_uk.ts), max(epu_us.ts, epu_uk.ts)),
     main='Political Uncertainty Index in UK')

plot(ur_uk.ts, ylab = 'Unemployment Rate',  ylim=c(min(ur_us.ts, ur_uk.ts), max(ur_us.ts, ur_uk.ts)),
     main='Unemployment Rate in UK')



