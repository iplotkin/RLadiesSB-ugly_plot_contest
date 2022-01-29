library(tidyverse)

# potentially useful function: read_csv
sweaters <- read_csv(here::here("data/use_this_data", "holiday_sweaters-2020-12-15-clean.csv")) %>% 
  filter(hs_tf == "Yes") %>% 
  # separate image_desc column into rows
  separate_rows(image_desc, sep = c(", ")) %>% 
  group_by(image_desc) %>% 
  summarize(sum = length(image_desc))

ggplot(sweaters, aes(x = image_desc, y = sum)) +
  geom_point(size=25, color = c("chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen",  "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1"), 
             aes(y=(100 * runif(65)), )) + 
  geom_segment(size=1, color = c("cornsilk", "goldenrod2", "khaki1", "cornsilk2", "lemonchiffon", "lightgoldenrod1", "salmon", "sienna1", "palegoldenrod", "yellowgreen", "cornsilk", "goldenrod2", "khaki1", "cornsilk2", "lemonchiffon", "lightgoldenrod1", "salmon", "sienna1", "palegoldenrod", "yellowgreen", "cornsilk", "goldenrod2", "khaki1", "cornsilk2", "lemonchiffon", "lightgoldenrod1", "salmon", "sienna1", "palegoldenrod", "yellowgreen", "cornsilk", "goldenrod2", "khaki1", "cornsilk2", "lemonchiffon", "lightgoldenrod1", "salmon", "sienna1", "palegoldenrod", "yellowgreen", "cornsilk", "goldenrod2", "khaki1", "cornsilk2", "lemonchiffon", "lightgoldenrod1", "salmon", "sienna1", "palegoldenrod", "yellowgreen", "cornsilk", "goldenrod2", "khaki1", "cornsilk2", "lemonchiffon", "lightgoldenrod1", "salmon", "sienna1", "palegoldenrod", "yellowgreen", "cornsilk", "goldenrod2", "khaki1", "cornsilk2", "lemonchiffon"),
               aes(x = image_desc, 
                   xend = image_desc, 
                   y = 0,
                   yend = (sum + (100 * runif(65))) )) + 
  theme_dark(base_size = 10) +
  labs(x = "Y-axis",
       y = "X-axis",
       title = "Untitled")

ggsave(here::here("figures", "lab2-plot.jpg"), width = 5, height = 4, dpi = 150)


