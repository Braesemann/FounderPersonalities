
library(data.table)
library(tidyverse)
library(RColorBrewer)



# -----------
# FIG 2A PLOT
# -----------
# Having a larger founder team elevates the chances of success. 
# This can be due to multiple reasons, e.g., a more extensive network or 
#knowledge base but also personality diversity.


df_Fig2A <- fread("Fig2A_df.csv")

df_Fig2A %>%  group_by(org_numfounders) %>%
  summarise(value = mean(success), 
            se = sqrt(mean(success)*(1-mean(success)))/sqrt(n()),
            n = n()) %>% filter(n>=20) %>%
  ggplot(aes(x = as.factor(org_numfounders), y = value)) + 
  geom_bar(stat = "identity", fill = "lightblue") + 
  geom_errorbar(aes(ymin = value - se, ymax = value + se), width = 0.2) + 
  theme_minimal() +
  labs(y = "", x = "", title = "Chances of Success", 
       subtitle = "By Number of Founders...") 




# -----------
# FIG 2B PLOT
# -----------
# We show that joint personality combinations of founders are significantly 
#related to higher chances of success. 
# This is because it takes more than one founder to cover all beneficial 
#personality traits that lead to a success.

df_Fig2B <- fread("Fig2B_df.csv")


### Calculate firm-max of Big 5 across success
df_stats <- data_frame()

for (t in c("big5_openness_percentile",
            "big5_conscientiousness_percentile",
            "big5_extraversion_percentile",
            "big5_agreeableness_percentile",
            "big5_neuroticism_percentile")) {
  temp <- df_Fig2B %>% rename(type = t) %>% group_by(anon_org, success) %>% 
    #summarise(type = mean(type)) %>%
    group_by(key = success) %>%
    summarise(value = mean(type, na.rm = T),
              se_wrong = sqrt(mean(type, na.rm = T)*
                                (1-mean(type, na.rm = T)))/sqrt(n()), 
              # I DON'T UNDERSTAND THIS CALCULATION
              se = sd(type, na.rm = T) / sqrt(n()),
              val_50 = median(type, na.rm = T),
              val_75 = quantile(type, na.rm = T, probs = 0.75),
              val_25 = quantile(type, na.rm = T, probs = 0.25),
              N = n()) %>% mutate(big5 = t)
  df_stats <- rbind(df_stats,temp)
}



### Plot firm-max of Big 5 across success 
# --> WITH MEANS AND CORRECTED STANDARD ERRORS AS CONFICDENCE INTERVALS <--
df_stats %>% mutate(key_name = ifelse(key == 0, "No Success (Other companies)", 
                                      "Success (IPO/Bought/Sold)"),
                    big5 = str_remove(str_remove(big5,"_percentile"),"big5_"),
                    big5 = str_to_title(big5),
                    value = value) %>%
  ggplot(aes(x = big5, y = value, group = key_name, color = key_name)) + 
  theme_minimal() +
  #scale_y_continuous(trans = "log") +
  geom_point(aes(y = value, group = key_name, colour = key_name), 
             position = position_dodge(1), size = 2) +
  geom_errorbar(aes(ymin = value + 1.96*se, ymax = value - 1.96*se), 
                position = position_dodge(1), size = 1) +
  scale_colour_manual(values = c("#BF3530", "#3B753A")) +
  facet_wrap(~big5, scales = "free", ncol = 6) +
  labs(y = "Percentile score of personality domain", x = "", colour = "") +
  theme(legend.position = "bottom", legend.direction = "vertical", 
        text = element_text(size = 13))










#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# -----------------------
# EXTENDED DATA FIGURE 1A 
# -----------------------
# World Map: On a country level, chances for success are highest in the US, Japan, West Europe, and Scandinavian countries

library(countrycode)
library(maps)



df_Fig1A <- fread("ED_Fig1A_df.csv")





cb_countries <- df_Fig1A %>% group_by(iso3c = org_country) %>% mutate(n=n()) %>% 
  summarise(value = mean(success), se = sqrt(mean(success)*(1-mean(success)))/sqrt(n()), n = n())

cb_countries <- cb_countries %>% mutate(iso3c = countrycode(sourcevar = iso3c, origin = "iso3c", destination = "iso3c"))



# get world map
map.world <- map_data('world')

# Get iso codes for countries
map.world$iso3c <- countrycode(map.world$region, origin = 'country.name', destination='iso3c')

# Join map data and Fig1 data
map.world <- map.world %>% left_join(cb_countries, by = "iso3c") 

# Use RColorBrewer to get a range of colours
col_range <- brewer.pal(9, "Greens")
col_range <- colorRampPalette(col_range)
cols <- col_range(length(unique(factor(map.world$value))))

# Plot the map
map.world %>%
  ggplot(aes( x = long, y = lat, group = group )) +
  geom_polygon(aes(fill = factor(value)), colour = "black", lwd = 0.25) + 
  scale_fill_manual(values = cols,na.value = "grey80")+
  theme_minimal() +
  labs(fill = '',x = NULL,y = NULL) +
  theme(legend.position = "none", panel.grid = element_blank(), axis.text = element_blank())




#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# -----------------------
# EXTENDED DATA FIGURE 1B 
# -----------------------
# Firms from the payment and software industries have high chances of success.


df_Fig1B <- fread("ED_Fig1B_df.csv")


### Plot chances of success by industry
df_Fig1B %>% filter(n>0) %>%
  ggplot(aes(x = reorder(industrytype,value), y = value, fill = N)) + geom_bar(stat = "identity") + 
  geom_errorbar(aes(ymin = value - se, ymax = value + se), width = 0.2) + theme_minimal() +
  theme(axis.text.x = element_text(angle = 70, hjust=1)) +  theme(legend.position = "none") + coord_flip() +
  labs(y = "", x = "", title = "Chances of Success", subtitle = "By Firm Industry Type") 




#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# -----------------------
# EXTENDED DATA FIGURE 1C 
# -----------------------
# Chances of success are positively related to a firm’s maturity, with firms that are seven years or older having higher chances of success.

df_Fig1C <- fread("ED_Fig1C_df.csv")

## Main plot
df_Fig1C %>% group_by(org_founded_year) %>%
  summarise(value = mean(success), se = sqrt(mean(success)*(1-mean(success)))/sqrt(n())) %>%
  ggplot(aes(x = org_founded_year, y = value)) + geom_bar(stat = "identity", fill = "lightblue") + 
  geom_errorbar(aes(ymin = value - se, ymax = value + se), width = 0.2) + theme_minimal() +
  labs(y = "", x = "", title = "Chances of Success", subtitle = "By Founding Year of Firm") 

# Inset
df_Fig1C %>% group_by(org_age) %>%
  summarise(value = mean(success), se = sqrt(mean(success)*(1-mean(success)))/sqrt(n())) %>%
  ggplot(aes(x = org_age, y = value)) + geom_point() + geom_errorbar(aes(ymin = value - se, ymax = value + se), width = 0.2) + 
  theme_minimal() + geom_smooth() + 
  labs(y = "Chances of Success", x = "Firm Age")




# -----------------------
# EXTENDED DATA FIGURE 12 
# -----------------------
# Occupations within Startups: While Accomplishers are often 
# CEOs, CFOs or COOs, Fighters tend to be CTOs, CPOs, CCOs.

df_Fig12 <- fread("ED_Fig12_df.csv")


df_Fig12 %>%
  ggplot(aes(x = rel, 
             y = personality_type, 
             color = as.factor(personality_type))) + geom_point(size = 3) + 
  geom_segment(aes(x = 0, 
                   xend = rel, 
                   y = personality_type, 
                   yend = personality_type)) + 
  facet_wrap(~key, nrow = 2) +
  theme_minimal() +
  scale_color_brewer(palette = "RdBu") +
  labs(x = "Share of job roles", 
       y = "Personality types", 
       title = "Personality types by job role") +
  theme(legend.position = "none", 
        strip.text = element_text(size = 10, face = "bold"))




#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# -----------------------
# EXTENDED DATA FIGURE 16 
# -----------------------
# Founder Team and Success: Startups with multiple founders of the same personality types have higher chances of success.

df_Fig16 <- fread("ED_Fig16_df.csv")

### Plot changes of success by founder
df_Fig16 %>% filter(N >= 20) %>%
  ggplot(aes(x = n, y = value)) + geom_bar(stat = "identity", fill = "lightblue") + 
  facet_wrap(persontype ~ ., scale = "fixed", ncol = 3) + theme_minimal() +
  geom_errorbar(aes(ymin = value - se, ymax = value + se), width = 0.2) +
  labs(y = "", x = "", title = "Chances of Success", subtitle = "By Founder Personalities") 





