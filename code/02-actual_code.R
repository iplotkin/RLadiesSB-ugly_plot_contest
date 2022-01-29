# library(tidyverse)
# 
# sweaters <- read_csv(here::here("data/use_this_data", "holiday_sweaters-2020-12-15-clean.csv")) %>% 
#   filter(hs_tf == "Yes") %>% 
#   # potentially useful function: separate colors column into rows
#   separate_rows(colors, sep = c(", ")) %>% 
#   group_by(sweater) %>% 
#   mutate(sum = length(colors)) %>% 
#   rownames_to_column("values")
# 
# ggplot(sweaters, aes(x = sweater, y = sum)) +
#   geom_point(aes(color = colors)) +
#   labs(x = "Entry", 
#        y = "Total number of colors") +
#   facet_wrap(~sparkly) +
#   theme(strip.background = element_rect(fill = "blue"),
#         plot.background = element_rect(fill = "pink"),
#         legend.background = element_rect(fill = "orange"))
# 
# ggsave(here::here("figures/an-plot.jpg"), width = 7, height = 4, dpi = 150)


library(tidyverse)

# potentially useful function: read_csv
sweaters <- read_csv(here::here("data/use_this_data", "holiday_sweaters-2020-12-15-clean.csv")) %>% 
  filter(hs_tf == "Yes") %>% 
  # potentially useful function: separate colors column into rows
  separate_rows(image_desc, sep = c(", ")) %>% 
  group_by(image_desc) %>% 
  sweaters[, 1] + 5
  summarize(sum = length(image_desc))

ggplot(sweaters, aes(x = image_desc, y = sum)) +
  #geom_col(aes(color = colors, fill = colors)) +
  
  # scale_fill_manual(values = c("mediumorchid1", "lightyellow3", "salmon3", "salmon2", "slateblue4", "yellowgreen", "lawngreen", "tan", "ivory", "khaki2", "chocolate", "blue1", "darkkhaki", "forestgreen", "firebrick3", "goldenrod1", "grey0", "lightblue1", "honeydew2", "olivedrab", "ghostwhite")) +
  # geom_errorbar(aes(ymin = sum - 2, ymax = sum + 3)) +
  geom_point(size=5, color = c("chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen",  "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1", "turquoise1", "green1", "gold", "deepskyblue", "darkgreen", "chartreuse", "cyan", "magenta", "seagreen1", "slateblue1"), 
             aes(y=(100 * runif(65)), )) + 
  geom_segment(aes(x = image_desc, 
                   xend = image_desc, 
                   y = 0,
                   yend = (sum + (100 * runif(65))) )) + 
  theme_classic(base_size = 10) +
  labs(x = "Y-axis",
       y = "X-axis",
       title = "Untitled")

ggsave(here::here("figures", "lab2-plot.jpg"), width = 5, height = 4, dpi = 150)


