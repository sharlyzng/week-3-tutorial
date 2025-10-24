str(dataset)
names(dataset)
dim(dataset)
df<-dataset%>%
  dplyr::select(Entity,Year,deaths_all_disasters,injured_all_disasters,homeless_all_disasters)%>%
  rename(deaths=deaths_all_disasters,injuries=injured_all_disasters,homeless=homeless_all_disasters,country=Entity)
averages<-df%>%
  filter(!country%in%c("World","Soviet Union"))%>%
  group_by(country)%>%
  summarise(
    avg_deaths=mean(deaths,na.rm=TRUE),
    avg_injuries=mean(injuries,na.rm=TRUE),
    avg_homeless=mean(homeless,na.rm=TRUE)
  )
top_10_deaths<-averages%>%
  arrange(desc(avg_deaths))%>%
  slice(1:10)%>%
  kable(caption="Top 10 Countries by Average Deaths")
