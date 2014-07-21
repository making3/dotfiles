Dir.foreach('.') do |item|
    next if item == '.' or item == '..' 
    next if File.fnmatch('ntuser.*', item, File::FNM_CASEFOLD)
    next if File.fnmatch('boot.*', item, File::FNM_CASEFOLD)
    
    if File.directory? item
        # Append / at the end to indicate it's a dir
        puts "#{item}/"
    else
        puts item
    end
end
