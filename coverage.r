getwd()
setwd("C:/Users/hp/OneDrive/Desktop")

library(tidyverse)
library(dplyr)
library(readr)
library(xlsx)
library(data.table)
library(magrittr)

covfile <- read_tsv("coverage.txt")
head(covfile)

depthData <- read_tsv("depth.txt")
head(depthData)

genomeMeta <- read_tsv("covid.txt")
head(genomeMeta)

names(covfile)[1] <- 'genome'
head(covfile)

cov <- covfile
head(cov)

cov1<-dplyr::select(cov,genome,endpos,numreads) #%>%
combinedfile<-merge(genomeMeta,cov1,by='genome', all=TRUE)

head(cov1)
head(combinedfile)


basicStats<-depthData %>%
  group_by(genome) %>%
  summarize(mean=mean(depth), median=median(depth))


depthOf1<-filter(depthData,depth >0) %>%
  group_by(genome) %>%
  summarize(Coveredby1=n())

depthOf10<-filter(depthData,depth>9) %>%
  group_by(genome) %>%
  summarize(Coveredby10=n())

depthOf50<-filter(depthData,depth>49) %>%
  group_by(genome) %>%
  summarize(Coveredby50=n())

depthOf100<-filter(depthData,depth>99) %>%
  group_by(genome) %>%
  summarize(Coveredby100=n())

moreStats<-left_join(combinedfile,basicStats, by='genome') %>%
  left_join(depthOf1, by='genome') %>%
  left_join(depthOf10, by='genome') %>%
  left_join(depthOf50, by='genome') %>%
  left_join(depthOf100, by='genome')
moreStats[is.na(moreStats)] <- 0 # clever


moreStats<-moreStats %>% mutate(coverage1x=Coveredby1/endpos) %>%
  mutate(coverage10x=Coveredby10/endpos) %>%
  mutate(coverage50x=Coveredby50/endpos) %>%
  mutate(coverage100x=Coveredby100/endpos) %>%
  dplyr::rename(length=endpos)

view(moreStats)

write.xlsx(moreStats, "C:/Users/hp/OneDrive/Desktop/coverage_stats_new.xlsx", sheetName = "coverage_stats", 
           col.names = TRUE, row.names = TRUE, append = FALSE)
