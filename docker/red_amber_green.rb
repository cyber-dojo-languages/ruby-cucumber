
lambda { |stdout,stderr,status|
  output = stdout + stderr

  return :amber if /SyntaxError/.match(output)
  return :amber if /NameError/.match(output)
  return :amber if /^[.-UF]*U[.-UF]*$/.match(output)
  return :red if /^[.-UF]*F[.-UF]*$/.match(output)
  return :green
}
