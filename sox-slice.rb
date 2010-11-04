#!/usr/bin/env ruby

class Slicer
    NUM_SLICES = 10
    def usage
        puts "give me a list of wav (or sox compatible files on the commandline"
    end
    def slice(file)
        if !File.exist? file
            raise "File doesn't exist (#{file})"
        end
        if !File.file? file
            raise "File isn't a file (#{file})"
        end
        if !File.readable? file
            raise "File isn't readable (#{file})"
        end
    end
end

slicer = Slicer.new

if ARGV.empty? 
    slicer.usage
else
    ARGV.each do|a|
        slicer.slice a
    end
end
