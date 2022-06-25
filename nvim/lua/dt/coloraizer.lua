require 'colorizer'.setup({
  '*'; -- Highlight all files, but customize some others.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
}, {rgb_fn = true, RRGGBBAA = true, css = true})
