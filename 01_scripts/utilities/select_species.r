## Function to select a species and set some environment variables based on the species
##  such as sex_gene, species_gene, and data file locations

select_species <- function() {
  
  # Menu-based species identification
  writeLines(c(""
               , "Select Species"
               , "1 - chinook"
               , "2 - coho"
               , "3 - chum"
               , "4 - eulachon"
               , "5 - sockeye"
               , "q - quit")
             , sep="\n")
  ans <- readline("Select species by number above or q: " )
  
  # If answer is not one of the species choices, terminate menu
  if (!(ans %in% c("1","2","3","4","5"))) {stop("Terminated by request")}
  
  # Select species
  species <<- c("chinook","coho","chum","eulachon","sockeye")[as.integer(ans)]
  print(paste("You have chosen: ",species))
  
  # Set variables sex_gene, species_gene, two.letter.code
  if(species=="coho") {
    sex_gene <<- "Ots_SEXY3_1"
    species_gene <<- "OkiOts_120255_113"
    two.letter.code <<- "co"
  }else if(species=="chinook") {
    sex_gene <<- "Ots_SEXY3_1-1507"
    species_gene <<- "OkiOts_120255-113"
    two.letter.code <<- "ch"
  }else if(species=="chum") {
    sex_gene <<- ""
    species_gene <<- ""
    two.letter.code <<- "cm"
  }else if(species=="eulachon") {
    sex_gene <<- ""
    species_gene <<- ""
    two.letter.code <<- "eu"
  }else if(species=="sockeye") {
    sex_gene <<- ""
    species_gene <<- ""
    two.letter.code <<- "sk"    
  }
  
  # Set the directory and filename for the database (input and output)
  # Will depend on whether on the network (windows) or off the network (unix)
  if(.Platform$OS.type == "unix") {
    
    # general path
    general.path <<- ""
    
    # Working path (for random stuff)
    working.path <<- ""
    
    #TVC Stock Seperated file locations
    base.path <<- paste0(general.path,"base/")
    mix.path <<- paste0(general.path,"mix/")
    
    # Result path
    result.path <<- "04_QC/"
    genepop.path <<- "03_genepop/"
    db.path <<- "05_databases/"
    rubias_base.path <<- "07_rubias_base/"
    rubias_mix.path <<- "08_rubias_mix/"
    
    # Extraction sheets
    ES.base <<- paste0("00_archive/", species, "_PBT_ES.txt") # base
    ES.mix <<- paste0("00_archive/", species, "_mix_PBT_ES.txt",sep="") # mix
    
    # Stock codes
    sc.base.source <<- NULL
    sc.base <<- paste0("00_archive/", two.letter.code, "StockCodesCU.txt")
    sc.base.gps <<- paste0("00_archive/", two.letter.code, "StockCodes_w_GPS.txt")
    sc.mix <<- paste0("00_archive/", two.letter.code, "mixCodes.txt")
    
    # Hotspot file
    hotspot.file <<- paste0("00_archive/", species, "_hotspot_detail.txt")
    
    
  } else if(.Platform$OS.type == "windows") {
    
    # general path
    general.path <<- paste0("H:/BEACHAMT/", species, "/PBT/")
    
    # Working path (for random stuff)
    working.path <- "S:/00_work/"
    
    #Process path - default path for data output
    process.path <- paste0("W:/1_GSI/PBT/", species, "/")
    
    #TVC Stock Seperated file locations
    base.path <<- paste0(general.path,"base/")
    mix.path <<- paste0(general.path,"mix/")
    
    # Result path
    result.path <<- "04_QC/"
    genepop.path <<- "03_genepop/"
    db.path <<- "05_databases/"
    #  rubias_base.path <<- "07_rubias_base/"
    rubias_base.path <<- paste0(process.path,"rubias/")
    #  rubias_mix.path <<- "08_rubias_mix/"
    rubias_mix.path <<- paste0(process.path,"mrubias/")
    
    # Extraction sheets
    ES.base <<- paste0("W:/9_PBT/01_", species, "/", species, "_PBT_ES.txt",sep="") # base
    ES.mix <<- paste0("W:/9_PBT/01_", species, "/", species, "_mix_PBT_ES.txt",sep="") # mix
    
    # Stock codes
    sc.base.source <<- paste0("W:/9_PBT/01_", species, "/", two.letter.code,  "StockCodesCU.xlsx")
    sc.base <<- paste0("H:/Stock_Codes/", species, "/", two.letter.code,  "StockCodesCU.txt")
    sc.base.gps <<- paste0("H:/Stock_Codes/", species, "/", two.letter.code, "StockCodes_w_GPS.txt")
    sc.mix <<- paste0("H:/Stock_Codes/", species, "/", two.letter.code,  "mixCodes.txt")
    
    # Hotspot file
    hotspot.file <<- paste0("W:/9_PBT/01_", species, "/", species, "_hotspot_detail.txt",sep="")
    
  }
}