# mar

## dplyr-erized connection to MRI oracle database


```r
# devtools::install_github("bernardocaldas/dplyrOracle")
# devtools::install_github("einarhjorleifsson/mar")
library(ggplot2)
library(mar)
library(dplyr)
library(dplyrOracle)
mar <- src_oracle("mar")
st <-
  lesa_stodvar(mar) %>%
  filter(ar %in% c(1985:2016),
         veidarf == 73)
```



```r
glimpse(st)
```

```
## Observations: NA
## Variables: 51
## $ synis.id       (int) 48659, 48661, 48662, 48663, 48664, 48665, 48666...
## $ leidangur      (chr) "TA1-91", "TA1-91", "TA1-91", "TA1-91", "TA1-91...
## $ skip.nr        (int) 1307, 1307, 1307, 1307, 1307, 1307, 1307, 1307,...
## $ stod           (int) 90, 88, 87, 86, 85, 84, 83, 12, 11, 9, 8, 7, 6,...
## $ dags           (time) 1991-03-21, 1991-03-21, 1991-03-21, 1991-03-21...
## $ reitur         (int) 722, 722, 722, 722, 722, 672, 672, 669, 669, 66...
## $ smareitur      (int) 4, 4, 4, 4, 3, 1, 1, 3, 3, 4, 1, 2, 4, 2, 1, 1,...
## $ hnattstada     (int) -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,...
## $ kastad.breidd  (int) 671385, 670723, 670598, 670092, 670024, 665649,...
## $ kastad.lengd   (int) 222482, 220234, 222013, 222505, 223480, 224027,...
## $ hift.breidd    (int) 671091, 671022, 670740, 670300, 670063, 665881,...
## $ hift.lengd     (int) 222455, 220237, 221325, 222751, 222718, 223530,...
## $ dypi.kastad    (int) 342, 210, 234, 200, 180, 183, 221, 161, 238, 31...
## $ dypi.hift      (int) 306, 239, 234, 213, 198, 196, 225, 161, 230, 31...
## $ veidarf        (int) 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73,...
## $ moskvastaerd   (int) 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40,...
## $ grandaralengd  (int) 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 35,...
## $ heildarafli    (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ l.hofn         (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ landsyni       (int) 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
## $ skiki          (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ fj.reitur      (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ aths           (chr) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ togbyrjun      (time) 1991-03-21 09:25:00, 1991-03-21 06:27:00, 1991...
## $ togendir       (time) 1991-03-21 10:14:00, 1991-03-21 07:15:00, 1991...
## $ toghradi       (dbl) 3.7, 3.8, 3.6, 4.0, 3.8, 3.8, 3.7, 4.1, 4.2, 3....
## $ toglengd       (dbl) 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 4.0, 4.0, 3....
## $ vir.uti        (int) 375, 325, 325, 300, 300, 275, 325, 250, 350, 37...
## $ lodrett.opnun  (dbl) 2.7, 2.6, 2.6, 2.6, NA, 2.6, NA, 2.2, 2.2, 2.2,...
## $ togtimi        (int) 49, 48, 50, 45, 48, 47, 49, 58, 57, 51, 30, 70,...
## $ togdypi.kastad (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ togdypi.hift   (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ togdypishiti   (dbl) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ eykt           (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ kl.byrjun      (chr) "0925", "0627", "0500", "0135", "0027", "2316",...
## $ kl.endir       (chr) "1014", "0715", "0550", "0220", "0115", "0003",...
## $ vindhradi      (int) 0, 5, 7, 7, 7, 9, 9, 5, 5, 5, 5, 5, 7, 9, 9, 7,...
## $ vindatt        (int) 0, 32, 32, 32, 32, 2, 2, 5, 5, 5, 5, 5, 5, 5, 5...
## $ vedur          (int) 1, 9, 9, 9, 9, 1, 1, 2, 2, 1, 2, 2, 1, 1, 1, 1,...
## $ sky            (int) 6, 9, 9, 9, 9, 4, 4, 7, 7, 7, 7, 7, 6, 7, 9, 9,...
## $ sjor           (int) 3, 4, 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 2, 4, 4, 4,...
## $ botnhiti       (dbl) 0.3, 2.6, 0.5, 4.1, 4.0, 4.0, 3.8, 4.3, 4.7, 4....
## $ yfirb.hiti     (dbl) 3.0, 3.1, 3.3, 3.5, 3.4, 3.4, 3.2, 3.3, 3.5, 3....
## $ lofthiti       (dbl) 0.0, -0.3, -0.5, -0.5, -0.5, 0.0, 0.0, 1.4, 1.7...
## $ loftvog        (int) 1006, 1004, 1003, 1002, 1002, 1001, 1000, NA, N...
## $ hafis          (int) 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
## $ straumstefna   (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ straumhradi    (dbl) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ sjondypi       (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ ar             (dbl) 1991, 1991, 1991, 1991, 1991, 1991, 1991, 1991,...
## $ man            (dbl) 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,...
```



```r
st %>% 
  collect() %>% 
  mutate(lon1 = -gisland::geo_convert(kastad.lengd),
         lat1 =  gisland::geo_convert(kastad.breidd)) %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(lon1,lat1),alpha=0.2, size=1, col="red") +
  geom_polygon(data=gisland::iceland,aes(long,lat,group=group),fill="grey90") +
  coord_map(ylim=c(62,67.8), xlim=c(-31,-9)) +
  labs(x = NULL,y = NULL, title = "Spring survey stations")
```

![](README_files/figure-html/smb1-1.png)


```r
cod <-
  lesa_stodvar(mar) %>%
  filter(ar %in% c(1985:2016),
         veidarf == 73) %>% 
  select(synis.id, ar) %>% 
  left_join(lesa_lengdir(mar) %>%
               filter(tegund %in% 1),
            by = "synis.id") %>%
  left_join(lesa_numer(mar) %>%
              filter(tegund %in% 1) %>% 
              select(synis.id, fj.talid, fj.maelt),
            by = "synis.id") %>% 
  collect(n = 1e7) # should be allowed to pass n = -1, but returns an error
glimpse(cod)
```

```
## Observations: 593,693
## Variables: 9
## $ synis.id   (int) 48205, 48205, 48205, 48205, 48205, 48205, 48205, 48...
## $ ar         (dbl) 1991, 1991, 1991, 1991, 1991, 1991, 1991, 1991, 199...
## $ tegund     (int) 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
## $ lengd      (dbl) 74, 62, 26, 15, 9, 84, 73, 71, 68, 67, 53, 51, 44, ...
## $ fjoldi     (int) 1, 1, 1, 1, 4, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, ...
## $ kyn        (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ kynthroski (int) NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
## $ fj.talid   (int) 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ...
## $ fj.maelt   (int) 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46,...
```

```r
cod %>% 
  mutate(r = (1 + fj.talid/fj.maelt),
         fjoldi = r * fjoldi,
         fjoldi = ifelse(is.na(fjoldi),0,fjoldi),
         b = fjoldi * 0.01 * lengd^3) %>% 
  group_by(ar, synis.id) %>% 
  summarise(n = sum(fjoldi),
            b = sum(b, na.rm = T)) %>% 
  ggplot(aes(ar, b)) +
  stat_summary(fun.data = "mean_cl_boot", colour = "red") +
  expand_limits(y = 0) +
  labs(x = NULL, y = NULL, title = "Cod: Bootstrap mean biomass and confidence interval") +
  scale_x_continuous(breaks = seq(1985,2015,5))
```

![](README_files/figure-html/smb2-1.png)

Doing summarization within Oracle:

```r
cod <-
  lesa_stodvar(mar) %>%
  filter(ar %in% c(1985:2016),
         veidarf == 73) %>% 
  select(synis.id, ar) %>% 
  left_join(lesa_lengdir(mar) %>%
               filter(tegund %in% 1),
            by = "synis.id") %>%
  left_join(lesa_numer(mar) %>%
              filter(tegund %in% 1,
                     fj.maelt > 0) %>% 
              mutate(r = 1 + fj.talid/fj.maelt) %>% 
              select(synis.id, r),
            by = "synis.id") %>%
  mutate(lengd = ifelse(is.na(lengd), 0, lengd),
         fjoldi = ifelse(is.na(fjoldi), 0, fjoldi),
         r = ifelse(is.na(r), 0 , r),
         abu = r * fjoldi,
         bio = r * fjoldi * 0.01 * lengd^3) %>% 
  group_by(synis.id, ar) %>% 
  summarise(n = sum(abu),
            b = sum(bio)) %>% 
  collect()
glimpse(cod)
```

```
## Observations: 18,891
## Variables: 4
## $ synis.id (int) 48053, 48051, 48467, 48452, 47905, 48443, 48440, 4788...
## $ ar       (dbl) 1991, 1991, 1991, 1991, 1991, 1991, 1991, 1991, 1991,...
## $ n        (dbl) 1, 9, 67, 1048, 17, 88, 107, 218, 9, 6, 46, 7, 20, 33...
## $ b        (dbl) 3732.48, 35606.49, 13199.50, 1607012.48, 69644.65, 12...
```
