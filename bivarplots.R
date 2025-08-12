link="https://github.com/Magallanes-at-UTDT/dataViz_2025/raw/refs/heads/main/fragilityVariabilityPerformance_2023_2006.csv"

varperf=read.csv(link)
head(varperf)

library(ggplot2)

ggplot(data=varperf) + geom_point(aes(x=p3_human_rights_performance,y=p3_human_rights_variability))

ggplot(data=varperf) + geom_point(aes(x=p3_human_rights_performance,y=p3_human_rights_variability,color=region))

ggplot(data=varperf) + geom_point(aes(x=p3_human_rights_performance,y=p3_human_rights_variability)) + facet_wrap(~region)

table(varperf$region)

americas=c('South America','Central America and the Caribbean','North America')
ggplot(data=varperf[varperf$region %in% americas,],aes(x=p3_human_rights_performance,y=p3_human_rights_variability)) +
    geom_text(aes(label=country,color=region)) + theme(legend.position = "bottom")

ggplot(data=varperf[varperf$region %in% americas,],aes(x=p3_human_rights_performance,y=p3_human_rights_variability)) +
    geom_text(aes(label=country),size=2) + facet_grid(region~.)

# install.packages("ggrepel")
library(ggrepel)

americas=c('South America','Central America and the Caribbean','North America')
bivar_americas=ggplot(data=varperf[varperf$region %in% americas,],aes(x=p3_human_rights_performance,y=p3_human_rights_variability)) + theme_light()+
    geom_label_repel(aes(label=country,color=region)) + theme(legend.position = "bottom") +
    geom_vline(xintercept = 0, color='grey') + scale_y_log10()
bivar_americas

farlands=c('South America','East and Southeast Asia')
bivar_farlands=ggplot(data=varperf[varperf$region %in% farlands,],aes(x=p3_human_rights_performance,y=p3_human_rights_variability)) + theme_light()+
    geom_label_repel(aes(label=country,color=region,size=2),max.overlaps=20) + theme(legend.position = "bottom") +
    geom_vline(xintercept = 0, color='grey') + scale_y_log10()

bivar_farlands

saveRDS(bivar_americas,"bivar_americas.rds")
saveRDS(bivar_farlands,"bivar_farlands.rds")