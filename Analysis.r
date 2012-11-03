#Set working directory, load dataset into frame.
setwd ("C:\\Users\\Ironholds\\Documents\\Work\\Code\\R\\SkinUsage")
SkinUsage <- read.delim ("global_skins_combined.TSV", header = T, as.is = T)
options(scipen=999)

#Work out the total number of users we're dealing with here. In this case, 14,410,727.
sum(SkinUsage$UserNum)

#Load applicable library, work out total numbers per skin
library(plyr)
UserNum.By.Skin <- ddply(.data = SkinUsage,
				.variables = c("skin"),
				.fun = function(x) c(sum = sum(x[, "UserNum"])))

#And *now* we play the GRAPHING game. Also the library-loading game.
library(ggplot2)
qplot(UserNum.by.Skin$skin, UserNum.by.Skin$sum)
