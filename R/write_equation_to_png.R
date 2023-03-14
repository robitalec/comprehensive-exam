write_equation_to_png <- function(qmd_file) {
	pdf_file <- with_ext(qmd_file, 'pdf')
	png_file <- with_ext(qmd_file, 'png')

	quarto_render(qmd_file)

	density <- 600
	quality <- 100

	image_write(
		image_convert(image_read(pdf_file, density = density), 'png'),
		png_file,
		quality = quality,
		density = density
	)

	unlink(pdf_file)

	return(png_file)
}
