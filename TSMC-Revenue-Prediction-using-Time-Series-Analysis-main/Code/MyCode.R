plot(timeseries$Revenue)
Y <- ts(log10(timeseries$Revenue), start = 1999, frequency = 12)
plot(Y)

head(timeseries$Revenue)
Z=diff(Y)
plot(Z)
hwadd <- hw(Y, seasonal = "additive")

hwadd$model


length(Y)

head(Y)
Y[1]
Y[292]
hwadd$fitted

hwfittedvalue <- as.numeric(hwadd$fitted)

df_plot <- data.frame(
  Time   = time(Y),
  Actual = as.numeric(Y),
  Fitted = hwfittedvalue
)


library(ggplot2)


ggplot(df_plot, aes(x = Time)) +
  geom_line(aes(y = Actual, colour = "Actual")) +
  geom_line(aes(y = Fitted, colour = "Fitted"), linetype = "dashed") +
  labs(title = "Holt-Winters Additive Fit",
       y = "log10(Revenue)",
       colour = "Series") +
  theme_minimal()


Y <- log10(timeseries$Revenue)

length(timeseries$Revenue)
Z <- diff(Y, differences = 1)
plot_z <- ggplot(data.frame(Z),aes(x = 1:291, y = Z)) + geom_line(col = "darkred")+
  theme_light()+ xlab("t") + ylab(expression(~Z[t]) ) +
  labs(title = expression(~Z[t]~{'vs t plot'}),
       caption = expression(~{""}~Z[t]~{"="}~Y[t]~{"-"}~Y[t-1]~{", "} ~Y[t]~{"="}~log[10]~(R[t])))
plot_z




