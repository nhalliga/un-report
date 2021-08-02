#### 8/2/2021 R/BASH workshop
library(tidyverse)
gapminder_1997 <- read_csv("code/gapminder_1997.csv")

name <- "Courtney"
age <- 84
?read_csv

#### Plotting in R using ggplot
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  labs(x = "GDP Per Capita", y = "Life Expectancy") + 
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1e06) +
  labs(size = "Population (in millions)") +
  aes(shape = continent)
#### condense aes() and labs()
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1e06) +
  labs(x = "GDP Per Capita", y = "Life Expectancy", title = "Do people in wealthy countries live longer?", size = "Population (in millions)") + 
  geom_point() +
  scale_color_brewer(palette = "Set1") 
#### full dataset
gapminder_data <- read_csv("code/gapminder_data.csv")
ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, color = continent, group = country) +
  geom_line()
#### discrete plots
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_boxplot()
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin() +
  geom_point()
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_point() +
  geom_violin()
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin() +
  geom_jitter(width = 0.3, height = 0)
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin() +
  geom_jitter(width = 0.3, height = 0, aes(size = pop))
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point()
## log transform data on the fly
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  scale_x_continuous(trans = "log10") ## not noted in x-axis label
ggplot(data = gapminder_1997) +
  aes(x = log10(gdpPercap), y = lifeExp) +
  geom_point()
## color vs fill
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(color = "green", fill = "blue") +
  geom_jitter(color = "purple")
violin_plot <- ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill = continent)) +
  geom_jitter(width = 0.3)
violin_plot <- violin_plot + theme_bw()
ggsave("figures/awesome_violin_plot.jpg", plot = violin_plot, width = 6, height = 4)

#### themes
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20, color = "black") +
  theme_classic() ## change #bins data is divided into
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20, color = "black") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = -90, hjust = 1, vjust = 0.5)) ## adjust x-axis labels

## facets
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_wrap(vars(continent))
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_grid(vars(continent)) ## all on single x axis
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, fill = continent) +
  geom_point(shape = 21, color = "black") +
  facet_grid(vars(continent)) +
  labs(x = "GDP per Capita", y = "Life Expectancy", title = "Do people in wealthier countries live longer") +
  theme_bw() ## make points more distinct
ggsave("figures/awesome_plot.jpg")
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, fill = continent) +
  geom_point(shape = 21, color = "black") +
  facet_grid(vars(continent)) +
  labs(x = "GDP per Capita", y = "Life Expectancy", title = "Do people in wealthier countries live longer") +
  theme_bw() +
  theme(axis.title = element_text(face = "bold"), title = element_text(face = "bold"), legend.position = "none") ## bold face and remove legend
ggsave("awesome_plot.jpg")
