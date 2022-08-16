library(ggplot2)
theme_set(theme_bw() + theme(legend.position = "top"))
# Load data
# data("mtcars")
df <- read.csv(file = "d:/profile.csv", fileEncoding = "UTF-8")

# Convert Ledend as a grouping variable
df$Ledend <- as.factor(df$Ledend)

# Inspect the data
head(df[, c("Ledend", "Capability", "Value", "Skill", "Years")], 28)
ggplot(df, aes(x = Value, y = Capability,label=Skill)) + 
geom_point(aes(color = Ledend, size = Years), alpha = 0.6) +
  scale_color_manual(values = c("#F70303","#2D8CF0","#00AFBB", "#E7B800", "#FC4E07","#FF00FB")) +
  scale_size(range = c(5, 33)) + geom_text(size=5, nudge_x=0,nudge_y=-0.35)+labs(caption="邓晓涛个人简历-202208")+
  ggtitle("邓晓涛职业技能能力分布图") + 
  guides(size = "none", color = guide_legend(override.aes = list(size = 10))) + 
  theme(plot.title = element_text(hjust = 0.5, size = 18),
        axis.text=element_text(size=12,face = "bold"),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16),
        legend.background = element_rect(color = "blue", linetype = "solid", size =0.25), 
        legend.position = c(0.82,0.12),
        legend.direction = "horizontal",
        legend.key.size = unit(1, 'cm'), 
        legend.key.height= unit(1, 'cm'),
        legend.key.width= unit(1, 'cm'),
        legend.title = element_text(size=18),
        legend.text = element_text(size=16))
