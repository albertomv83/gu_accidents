files <- data.table(filename=c("ACCIDENTS_PERSONES_GU_BCN_2010.csv",
                      "ACCIDENTS_PERSONES_GU_BCN_2011.csv",
                      "ACCIDENTS_PERSONES_GU_BCN_2012.csv",
                      "ACCIDENTS_PERSONES_GU_BCN_2013.csv",
                      "ACCIDENTS_PERSONES_GU_BCN_2014.csv",
                      "ACCIDENTS_PERSONES_GU_BCN_2015.csv",
                      "ACCIDENTS_VEHICLES_GU_BCN_2010.csv",
                      "ACCIDENTS_VEHICLES_GU_BCN_2011.csv",
                      "ACCIDENTS_VEHICLES_GU_BCN_2012.csv",
                      "ACCIDENTS_VEHICLES_GU_BCN_2013.csv",
                      "ACCIDENTS_VEHICLES_GU_BCN_2014.csv",
                      "ACCIDENTS_VEHICLES_GU_BCN_2015.csv",
                      "ACCIDENTS_TIPUS_GU_BCN_2010.csv",
                      "ACCIDENTS_TIPUS_GU_BCN_2011.csv",
                      "ACCIDENTS_TIPUS_GU_BCN_2012.csv",
                      "ACCIDENTS_TIPUS_GU_BCN_2013.csv",
                      "ACCIDENTS_TIPUS_GU_BCN_2014.csv",
                      "ACCIDENTS_TIPUS_GU_BCN_2015.csv"),
                    encoding=rep(c("CP437","CP437","CP437","CP437","CP437","latin1"),3))


for (i in 1:nrow(files)){
  path <- paste0(root_path,files[i,filename])
  text <- iconv(readChar(path, file.info(path)$size, useBytes = T),from = files[i,encoding], to ="UTF-8")
  output_path <- paste0(root_path,'utf8_data/',files[i,filename])
  fileConn<-file(output_path)
  writeLines(text, fileConn)
  close(fileConn)
}
