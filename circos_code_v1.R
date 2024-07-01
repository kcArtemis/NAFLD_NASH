library(circlize)

#reading the data
data1 <- read.csv("circos_df_HN.csv",header = T)

data2 <- read.csv("circos_df_LN.csv",header = T)

m1 <- as.matrix(data1[2])
m2 <- as.matrix(data2[2])


rownames(m1) <- data1$Gene_Name
rownames(m2) <- data2$Gene_Name

useT.mat1 <- t(m1)
mat_list1 = useT.mat1
useT.mat2 <- t(m2)
mat_list2 = useT.mat2

col_fun = colorRamp2(breaks= c(-5,0,5), 
                     colors = c("blue4","white","red")) 

#clear the graph
circos.clear()

#adjusting the layout 
circos.par("start.degree" = 90,cell.padding = c(0.01, 0, 0, 0), gap.degree = 15) 
circos.initialize("a", xlim =c(0,289))
circos.track(ylim = c(0, 3.57), bg.border = NA, track.height = 0.05, 
             panel.fun = function(x, y) {
               for(i in seq_len(ncol(useT.mat1))) {
                 circos.text(i-4.9, 0, colnames(useT.mat1)[i], adj = c(0, 10), 
                             facing = "clockwise", niceFacing = TRUE,
                             cex = 0.2)                
               }
             })
#set_track_gap(mm_h(0.01))
circos.track(ylim = c(0, 3.57),track.height = 0.10, bg.border = NA, panel.fun = function(x, y) {
  m1 = mat_list1
  #changed variable for 1 heatmap setting
  col_mat1 = col_fun(m1)
  nr = nrow(m1)
  nc = ncol(m1)
  for(i in 1:nr) {
    circos.rect(1:nc - 1, rep(nr - i, nc), 
                1:nc, rep(nr - i + 1, nc), 
                border = "grey", col = col_mat1[i, ],lwd = 0.01)
  }
  #circos.text(1:nc - 1/2, nr + 0.5, labels = colnames(m1), facing = "inside", niceFacing = TRUE, adj = c(0, 0.5))
})
#set_track_gap(inches_h(0.01))
circos.track(ylim = c(0, 3.57),track.height = 0.10, bg.border = NA, panel.fun = function(x, y) {
  m2 = mat_list2
  #changed variable for 1 heatmap setting
  col_mat2 = col_fun(m2)
  nr = nrow(m2)
  nc = ncol(m2)
  for(i in 1:nr) {
    circos.rect(1:nc - 1, rep(nr - i, nc), 
                1:nc, rep(nr - i + 1, nc), 
                border = "grey", col = col_mat2[i, ],lwd = 0.01)
  }
})


