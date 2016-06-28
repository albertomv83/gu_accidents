#read accidents
gu15 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_GU_BCN_2015.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu14 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_GU_BCN_2014.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu13 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_GU_BCN_2013.csv"), encoding='UTF-8', na.strings = c("Desconegut")))
gu12 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_GU_BCN_2012.csv"), encoding='UTF-8', na.strings = c("Desconegut")))
gu11 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_GU_BCN_2011.csv"), encoding='UTF-8', na.strings = c("Desconegut")))
gu10 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_GU_BCN_2010.csv"), encoding='UTF-8', na.strings = c("Desconegut")))


#set same names of header columns
colnames(gu15)[4]<-"NK.barri"
colnames(gu15)[10]<-"Dia.de.setmana"

#delete non common columns
gu14[,Número.de.víctimes:=NULL]
gu13[,Número.de.víctimes:=NULL]
gu12[,Número.de.víctimes:=NULL]
gu11[,Número.de.víctimes:=NULL]
gu10[,Número.de.víctimes:=NULL]

#merge all years
gu <- rbind(gu15,gu14,gu13,gu12,gu11,gu10)

#clean values
gu[,':='(Dia.de.setmana=as.character(Dia.de.setmana))]
gu[!is.na(Dia.de.setmana),':='(Dia.de.setmana=mapvalues(Dia.de.setmana,
                                                        from=c("1","2","3","4","5","6","7"),
                                                        to=c("Dl","Dm","Dc","Dj","Dv","Ds","Dg")))]
gu[,':='(Mes.de.any=as.factor(Mes.de.any),
         Dia.de.mes=as.factor(Dia.de.mes),
         Dia.de.setmana=as.factor(Dia.de.setmana),
         NK.Any=as.factor(NK.Any),
         Num.postal.caption=as.factor(Num.postal.caption),
         Codi.carrer=as.factor(Codi.carrer),
         Codi.districte=as.factor((Codi.districte)))]
