file_list <- list.files()
options(show.error.messages = FALSE)

file_list
DF <- NULL
for (f in file_list) {
   data <- read.delim(f, header=T, as.is = TRUE, sep="\t", na.strings="")
   DF <- rbind(DF, data)
}

write.table(DF, file = "IAMAGOD.tsv", quote = FALSE, append = FALSE, sep = "\t", col.names = TRUE, row.names = FALSE)