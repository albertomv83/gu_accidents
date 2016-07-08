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

#delete non common columns. gu15 doesn't have Número.de.víctimes.
#Also (Número.de.morts+Número.de.lesionats.lleus+Número.de.lesionats.greus)==Número.de.víctimes
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
         Hora.de.dia=as.factor(Hora.de.dia),
         NK.Any=as.factor(NK.Any),
         Num.postal.caption=as.factor(Num.postal.caption),
         Codi.carrer=as.factor(Codi.carrer),
         Codi.districte=as.factor((Codi.districte)))]

#read accidents causes
gu_c15 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_CAUSES_GU_BCN_2015.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_c14 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_CAUSES_GU_BCN_2014.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_c13 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_CAUSES_GU_BCN_2013.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_c12 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_CAUSES_GU_BCN_2012.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_c11 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_CAUSES_GU_BCN_2011.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_c10 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_CAUSES_GU_BCN_2010.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))

#merge all years of causes
gu_c <- rbind(gu_c15,gu_c14,gu_c13,gu_c12,gu_c11,gu_c10)

#clean values
gu_c[,':='(Mes.de.any=as.factor(Mes.de.any),
         Dia.de.mes=as.factor(Dia.de.mes),
         Dia.setmana=as.factor(Dia.setmana),
         Hora.de.dia=as.factor(Hora.de.dia),
         NK.Any=as.factor(NK.Any),
         Num.postal.caption=as.factor(Num.postal.caption),
         Codi.carrer=as.factor(Codi.carrer),
         Codi.barri=as.factor(Codi.barri),
         Codi.districte=as.factor((Codi.districte)))]

#read accidents people
gu_p15 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_PERSONES_GU_BCN_2015.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_p14 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_PERSONES_GU_BCN_2014.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_p13 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_PERSONES_GU_BCN_2013.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_p12 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_PERSONES_GU_BCN_2012.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_p11 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_PERSONES_GU_BCN_2011.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_p10 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_PERSONES_GU_BCN_2010.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))

#merge all years of people's data
gu_p <- rbind(gu_p15,gu_p14,gu_p13,gu_p12,gu_p11,gu_p10)

#clean values
gu_p[,':='(Mes.de.any=as.factor(Mes.de.any),
           Dia.de.mes=as.factor(Dia.de.mes),
           Dia.setmana=as.factor(Dia.setmana),
           Hora.de.dia=as.factor(Hora.de.dia),
           NK.Any=as.factor(NK.Any),
           Num.postal.caption=as.factor(Num.postal.caption),
           Codi.carrer=as.factor(Codi.carrer),
           Codi.barri=as.factor(Codi.barri),
           Codi.districte=as.factor((Codi.districte)))]

#read vehicles data
gu_v15 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_VEHICLES_GU_BCN_2015.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_v14 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_VEHICLES_GU_BCN_2014.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_v13 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_VEHICLES_GU_BCN_2013.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_v12 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_VEHICLES_GU_BCN_2012.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_v11 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_VEHICLES_GU_BCN_2011.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_v10 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_VEHICLES_GU_BCN_2010.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))

#merge all years of people's data
gu_v <- rbind(gu_v15,gu_v14,gu_v13,gu_v12,gu_v11,gu_v10)

#clean values
gu_v[,':='(Mes.de.any=as.factor(Mes.de.any),
           Dia.de.mes=as.factor(Dia.de.mes),
           Dia.setmana=as.factor(Dia.setmana),
           Hora.de.dia=as.factor(Hora.de.dia),
           NK.Any=as.factor(NK.Any),
           Num.postal.caption=as.factor(Num.postal.caption),
           Codi.carrer=as.factor(Codi.carrer),
           Codi.barri=as.factor(Codi.barri),
           Codi.districte=as.factor(Codi.districte),
           Antiguitat.carnet=as.factor(Antiguitat.carnet))]

#read tipus data
gu_t15 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_TIPUS_GU_BCN_2015.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_t14 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_TIPUS_GU_BCN_2014.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_t13 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_TIPUS_GU_BCN_2013.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_t12 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_TIPUS_GU_BCN_2012.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_t11 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_TIPUS_GU_BCN_2011.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))
gu_t10 <- data.table(read.csv(paste0(root_path,"utf8_data/ACCIDENTS_TIPUS_GU_BCN_2010.csv"), encoding='UTF-8', na.strings = c("Desconegut"), sep=';'))

#merge all years of people's data
gu_t <- rbind(gu_t15,gu_t14,gu_t13,gu_t12,gu_t11,gu_t10)

#clean values
gu_t[,':='(Mes.de.any=as.factor(Mes.de.any),
           Dia.de.mes=as.factor(Dia.de.mes),
           Dia.setmana=as.factor(Dia.setmana),
           Hora.de.dia=as.factor(Hora.de.dia),
           NK.Any=as.factor(NK.Any),
           Num.postal.caption=as.factor(Num.postal.caption),
           Codi.carrer=as.factor(Codi.carrer),
           Codi.barri=as.factor(Codi.barri),
           Codi.districte=as.factor(Codi.districte))]
