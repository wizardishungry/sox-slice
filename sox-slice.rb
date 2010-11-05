#!/usr/bin/env ruby

NUM_SLICES = 10
LOW_FREQ = 32
GAIN = 6 # dB

class Slicer
    def usage
        puts "give me a list of wav (or sox compatible files on the commandline"
    end
    def slice(file,slices,low_freq)
        @file=file
        @slices=slices
        slices=0..slices-1
        @freqs=slices.map{|x| low_freq*(2**x)}

        if !File.exist? file
            raise "File doesn't exist (#{file})"
        end
        if !File.file? file
            raise "File isn't a file (#{file})"
        end
        if !File.readable? file
            raise "File isn't readable (#{file})"
        end

        inform = "slicing #{file} into #{slices.count} slices"
        puts "Beginning #{inform}"
        slices.each {|num| do_slice(num)}
        puts "Finished #{inform}"
    end

    protected

    def do_slice(num)
        puts "Slice #{num+1} of #{@slices}, #{@freqs[num]} hz"
    end
end

slicer = Slicer.new

if ARGV.empty? 
    slicer.usage
else
    ARGV.each do|a|
        slicer.slice a, NUM_SLICES, LOW_FREQ
    end
end
