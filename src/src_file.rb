#RGM, the RubyGoMake
#Copyright (C) 2011  Marian Sievers, avancet
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
class SrcFile
  #Klassenvariablen
  @@src_dir = "src"
  @@bin_dir = "bin"
  @@tmp_dir = "tmp"
  @@trenner = "-" * 20

  #Compiler = gccgo OR 8g&8l
  @@compiler = "go"
  @@GCCGO = "gccgo"
  @@GO_COMPILE = "6g"
  @@GO_LINK = "6l"

  def initialize(filename, folder)
    @filename = filename
    @src_folder = folder + "/"
    @src_name = @filename + ".go"
    @link_name = @filename + ".l"
    @output_name = @filename + ".o"
  end
  
  def initialize(filename)
    @filename = filename
    @src_folder = ""
    @src_name = @filename + ".go"
    @link_name = @filename + ".l"
    @output_name = @filename + ".o"
  end

  def compile
    if @@compiler == "gccgo"
      puts "Not yet implemented!"
    else
      befehl = "#{@@arch}g -I #{@@tmp_dir} -o #{@@tmp_dir}/#{@link_name} #{@@src_dir}/#{@src_folder}#{@src_name}"
    end

    puts befehl
    system(befehl)
    puts @@trenner
  end

  def link
    if @@compiler == "gccgo"
      puts "Not yet implemented!"
    else
      befehl = "#{@@arch}l -o #{@@bin_dir}/#{@output_name} #{@@tmp_dir}/#{@link_name}"
    end
    puts befehl
    system(befehl)
    puts @@trenner
  end

  def self.set_compiler(compiler)
    @@compiler = name
  end
  
  #6 = 6g/l, 8=8g/l
  def self.set_arch(arch)
    @@arch = arch
  end

  def list_vars
    puts @filename
    puts @src_name
    puts @link_name
    puts @output_name
    puts @@trenner
  end
end

#Just for testing
#test_file = SrcFile.new("test")
#SrcFile.set_compiler("go")
#SrcFile.set_arch("6")
#test_file.list_vars()
#test_file.compile()
#test_file.link()
