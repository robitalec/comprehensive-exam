# Combine literature ------------------------------------------------------
# Alec L. Robitaille


# Packages ----------------------------------------------------------------
library(data.table)


# Data --------------------------------------------------------------------
DT <-  dir('data/literature/', full.names = TRUE) |>
	lapply(function(x) fread(x)) |>
	rbindlist(fill = TRUE)


# Prepare -----------------------------------------------------------------
# Establish common fields
DT[!is.na(DI), DOI := DI]
DT[is.na(DOI)]

DT[is.na(PY), PY := Year]
DT[is.na(AU), AU := Authors]
DT[is.na(TI), TI := Title]
DT[is.na(SO), SO := `Source title`]


# Filter duplicates -------------------------------------------------------
# Count by DOI
DT[, n_by_doi := .N, DOI]

# Sequence among common DOIs
DT[, seq_by_doi := seq.int(.N), DOI]

# Check unique number of DOIs
DT[, uniqueN(DOI)]

# Check first row for each DOI
DT[seq_by_doi == 1]

# Output columns
out_cols <- c('PY', 'AU', 'TI', 'SO', 'DOI')

# Output data
out <- DT[seq_by_doi == 1, .SD, .SDcols = out_cols]
