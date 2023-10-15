#!/bin/bash

# Create a temporary directory to store intermediate CSV files
tmp_dir=$(mktemp -d)

# Define a function to generate FDF file from a PDF
generate_fdf() {
  pdf_file="$1"
  fdf_file="${tmp_dir}/$(basename "${pdf_file%.pdf}.fdf")"
  pdftk "$pdf_file" generate_fdf output "$fdf_file"
}

# Define a function to extract fields from FDF and append to a CSV
extract_fields_to_csv() {
  fdf_file="$1"
  csv_file="${tmp_dir}/all_data.csv"

  fields=$(paste -sd, <(grep -oP '(?<=\/T \(txt).*(?=\))' "$fdf_file") <(grep -oP '(?<=\/V \().*(?=\))' "$fdf_file"))
  
  echo "$fields" >> "$csv_file"
}

# Generate FDF files from PDFs in the current directory
find . -type f -name "*.pdf" | while read -r pdf_file; do
  generate_fdf "$pdf_file"
done

# Find all FDF files and extract fields to the common CSV
find "$tmp_dir" -type f -name "*.fdf" | while read -r fdf_file; do
  extract_fields_to_csv "$fdf_file"
done

# Remove blank lines in the CSV file
sed -i '/^$/d' "$tmp_dir/all_data.csv"

# Rename the temporary CSV file to the final output file
mv "$tmp_dir/all_data.csv" "all_data.csv"

# Clean up the temporary directory
rm -rf "$tmp_dir"

