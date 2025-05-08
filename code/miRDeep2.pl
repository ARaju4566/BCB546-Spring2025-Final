# Define directory paths
PROJECT_DIR="/Users/viraajv/Documents/BCB5460_Final_Project"
INPUT_DIR="$PROJECT_DIR/Analysis/trimmed_reads"
OUTPUT_DIR="$PROJECT_DIR/Analysis/mature_miRCounts"
DB_DIR="$PROJECT_DIR/databases"

# Define file paths
MAPPER_SCRIPT="/usr/local/Caskroom/miniforge/base/envs/miR_ref_pipeline/bin/mapper.pl"
QUANTIFIER_SCRIPT="/usr/local/Caskroom/miniforge/base/envs/miR_ref_pipeline/bin/quantifier.pl"
GENOME_DIR="/Users/viraajv/Documents/BCB5460_Final_Project/databases/Rnor.6.0"
GENOME_FA="$GENOME_DIR/Rnor6_index"
HAIRPIN_DB="$DB_DIR/hairpin.fa"
MATURE_DB="$DB_DIR/mature.fa"

# List of sample IDs                                                             
samples=("SRR18856083", "SRR18856084", "SRR18856085", "SRR18856086", "SRR18856087", "SRR18856088",
  "SRR18856089", "SRR18856090", "SRR18856091", "SRR18856092", "SRR18856093", "SRR18856094",
  "SRR18856095", "SRR18856096", "SRR18856097", "SRR18856098", "SRR18856099", "SRR18856100",
  "SRR18856101", "SRR18856102", "SRR18856103", "SRR18856104", "SRR18856105", "SRR18856106",
  "SRR18856107", "SRR18856108", "SRR18856109", "SRR18856110", "SRR18856111", "SRR18856112",
  "SRR18856113", "SRR18856114", "SRR18856115", "SRR18856116", "SRR18856117", "SRR18856118",
  "SRR18856119", "SRR18856120", "SRR18856121", "SRR18856122", "SRR18856123", "SRR18856124",
  "SRR18856125", "SRR18856126", "SRR18856127", "SRR18856128", "SRR18856129", "SRR18856130"
)                       
mkdir -p "$OUTPUT_DIR"                                       
# Run mapper and quantifier for each sample               
for sample in "${samples[@]}"; do                    
    fasta_file="$INPUT_DIR/${sample}_1_trimmed_cleaned.fasta"
    collapsed_fa="$OUTPUT_DIR/${sample}_collapsed.fa"
    arf_file="$OUTPUT_DIR/${sample}_vs_genome.arf"
    
    echo "🔁 Processing $sample..."     
    
    # Step 1: Collapse and map to genome
    "$MAPPER_SCRIPT" "$fasta_file" \
      -c -m -l 18 \    
      -s "$collapsed_fa" \
      -p "$GENOME_FA" \
      -t "$arf_file" \
      -v -n                        
    
    # Step 2: Quantify known miRNAs
    "$QUANTIFIER_SCRIPT" \
      -p "$HAIRPIN_DB" \  
      -m "$MATURE_DB" \
      -r "$collapsed_fa" \
      -t rno \        
      -y "$sample" \
      -d "$OUTPUT_DIR"      
    echo " Finished $sample"
done
