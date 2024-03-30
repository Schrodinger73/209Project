dat1 <- read.csv("- train US new.csv")
dat2 <- read.csv("test new.csv")
dat <- rbind(dat1, dat2)
write.csv(dat, "data.csv")
