command RspecThis execute "! rspec %"
command! -range HashConvert :%s/:\([^ ]*\)\(\s*\)=>/\1:/g
command! -range HashConvertLines <line1>,<line2>s/:\([^ ]*\)\(\s*\)=>/\1:/g
