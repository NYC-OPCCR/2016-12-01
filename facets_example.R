# Chunk 1
datafile = system.file("extdata", "stomach.csv.gz", package="facets")
head(read.csv(datafile)[,c(1:2,5:12)])
# Chromosome Position File1R File1A File1E File1D File2R File2A File2E File2D
# 1          1    69424    170    117      0      0    158    103      0      0
# 2          1    69515      0     76      0      0      0     77      0      0
# 3          1    69536    103      0      0      0     99      0      0      0
# 4          1   808866     96      0      0      0    133      0      0      0
# 5          1   809120     66      0      0      0    105      0      0      0
# 6          1   809176     79      0      0      0    126      0      0      0

# Chunk 2
library(facets)
# Loading required package: pctGCdata

# Chunk 3
set.seed(1234)
datafile = system.file("extdata", "stomach.csv.gz", package="facets")
rcmat = readSnpMatrix(datafile)
xx = preProcSample(rcmat)

# Chunk 4
oo=procSample(xx,cval=150)

# Chunk 5
oo$dipLogR
# [1] -0.04444348

# Chunk 6
fit=emcncf(oo)

# Chunk 7
head(fit$cncf)
# chrom seg num.mark nhet cnlr.median        mafR segclust cnlr.median.clust mafR.clust     start       end     cf.em tcn.em lcn.em
# 1     1   1     2631  158  0.50028101 0.305665373       12        0.49145998 0.38807104     69424  29651873 0.8767632      3      1
# 2     1   2     4598  249 -0.03699913 0.021520755        7       -0.04444348 0.01655667  31188034 144922109 1.0000000      2      1
# 3     1   3     6342  408  0.49218666 0.404039235       12        0.49145998 0.38807104 144922463 249212378 0.8767632      3      1
# 4     2   4     7006  375 -0.03654935 0.019844538        7       -0.04444348 0.01655667     41507 197673978 1.0000000      2      1
# 5     2   5       14    0 -0.85252562 0.000000000        6       -0.88771396         NA 197706054 197873655 0.8919360      1      0
# 6     2   6     2299   96 -0.05328541 0.001226293        7       -0.04444348 0.01655667 197947995 243061179 1.0000000      2      1

# Chunk 8
fit$purity
# [1] 0.891936

# Chunk 9
fit$ploidy
# [1] 2.070151

# Chunk 10
plotSample(x=oo,emfit=fit)

# Chunk 11
fit2=emcncf2(oo)
# fitting 1 clonal cluster ... 

# Chunk 12
head(fit2$cncf)
# chrom seg num.mark nhet cnlr.median        mafR segclust cnlr.median.clust mafR.clust     start       end    cf.em tcn.em lcn.em clonal.cluster
# 1     1   1     2631  158  0.50028101 0.305665373       12        0.49145998 0.38807104     69424  29651873 0.891936      3      1              1
# 2     1   2     4598  249 -0.03699913 0.021520755        7       -0.04444348 0.01655667  31188034 144922109 1.000000      2      1              1
# 3     1   3     6342  408  0.49218666 0.404039235       12        0.49145998 0.38807104 144922463 249212378 0.891936      3      1              1
# 4     2   4     7006  375 -0.03654935 0.019844538        7       -0.04444348 0.01655667     41507 197673978 1.000000      2      1              1
# 5     2   5       14    0 -0.85252562 0.000000000        6       -0.88771396         NA 197706054 197873655 0.891936      1      0              1
# 6     2   6     2299   96 -0.05328541 0.001226293        7       -0.04444348 0.01655667 197947995 243061179 1.000000      2      1              1
