library(lubridate)
library(plotly)

DF <- read.csv(file='mongodb_tweets.csv', sep=',', header=TRUE)
dtime <- rep(NA,nrow(DF))
for (i in 1:nrow(DF)) {
  dtime[i] = difftime(ymd_hms(DF$created[1]), ymd_hms(DF$created[i]), unit='hours')
}

r <- dtime
theta <- r%%1*360
tweettimes = data.frame(r=r,t=theta)
p <- plot_ly(
  #plotly::hobbs, r = ~r, t = ~t, color = ~nms, alpha = 0.5, type = "scatter"
  tweettimes, r=~r, t=~t, alpha=0.5, type="scatter"
)

layout(p, title = "Hobbs-Pearson Trials", plot_bgcolor = toRGB("grey90"))
