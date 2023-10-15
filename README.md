# PDF Form Data Extraction and CSV Generator

This little script allows you to recursively generate FDF files from PDFs and extract field data from FDF files. The extracted data is then saved to a single CSV file.

## Features

- Generates FDF files from PDFs in the current directory and its subdirectories.
- Extracts field data from FDF files and creates a common CSV file.
- Removes blank lines in the generated CSV file.

## Prerequisites

- [pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) - You need to have pdftk installed on your system.

## Usage

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/arfabee/fdf2csv.git
   
2. Make the script executable and run it

   ```shell
   chmod +x script.sh && ./fdf2csv.sh

3. The script will generate FDF files from PDFs in the current directory and extract the field data into a CSV file named all_data.csv.

## Contributing

Feel free to contribute to this project by opening issues or submitting pull requests.

## License

License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments

Thanks to pdftk for the PDF manipulation tool

## Author

M.A.
Happy PDF data extraction and CSV generation!

