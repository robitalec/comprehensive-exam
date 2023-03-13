write_equation_to_png <- function(qmd_file) {
	pdf_file <- file.path('public', with_ext(qmd_file, 'pdf'))
	png_file <- with_ext(qmd_file, 'png')

	quarto_render(qmd_file)

	image_write(
		image_convert(image_read(pdf_file), 'png'),
		png_file,
		quality = 90,
		density = 300
	)

	unlink(pdf_file)

	return(png_file)
}
