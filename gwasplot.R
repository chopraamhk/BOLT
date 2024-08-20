ao_gwas <- fread("ao_combined.stats")
library(fastman)

snpsx <- c("SNP_RSID")
pdf("/home/mchopra/Documents/gwas_new_pitch/gwas_aao.pdf")
fastman(
  ao_gwas,
  chr = "CHR",
  bp = "BP",
  p = "P_BOLT_LMM_INF",
  suggestiveline = -log10(1e-05), 
  genomewideline = -log10(5e-08),
  annotateHighlight = FALSE, 
  highlight = snpsx,
  annotateTop = FALSE, 
  colAbovePval = TRUE, 
  annotatePval = 1e-05,
  annotationCol = "white", 
  col2 = "red",
  cex.text = 0.7, cex.axis = 1, annotationAngle=0)
  
dev.off()
