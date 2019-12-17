def read_directory(dir_path)
  puts dir_path
  files = Dir.glob(dir_path << "/*")

  files.each do |filename|
    if File.directory?(filename)
      read_directory(filename)
    else
      text = File.read(filename)
      content = text.gsub(/col-md/, "col")
      File.open(filename, "w") { |file| file << content }
    end
  end
end


target_dir = Dir.glob("./app/views")

read_directory(target_dir)
