require 'json'

sites_file = File.read('bom-sites-all-20120129.txt')
sites_met_data_file = File.read('bom-sites-airtemp30mins-20140511.txt')

site_template = { :bom_id => nil, :name => nil, :lat => nil, :lng => nil, :wmo => nil, :height => nil, :current => false }

sites = []

sites_file.each_line do |line|
  if line.match(/^\s+\d+/)
    site = site_template.clone
    site[:bom_id]   = line[0..6].strip.to_i
    site[:state]    = line[7..10].strip
    site[:name]     = line[18..58].strip
    site[:current]  = (line[67..74].strip == '..')
    site[:lat]      = line[75..83].strip.to_f
    site[:lng]      = line[84..93].strip.to_f
    site[:wmo]      = line[129..135].strip
    site[:height]   = line[109..119].strip
    sites << site
  end
end

sites_to_keep = []

sites_met_data_file.each_line do |line|
  if(line.match(/^\s+\d{4}\d*/) && line[108..108] == 'Y')
    bom_id = line[0..6].strip.to_i
    site = sites.find{|s| bom_id == s[:bom_id]}
    sites_to_keep << site unless site.nil?
  end
end

sites_to_keep = sites_to_keep.reject{|s| !s[:current] || s[:wmo].nil? || s[:wmo] == ".." }.sort{|x,y| x[:name] <=> y[:name]}

File.open('bom_sites_weather.json','w+') {|f| f.write(sites_to_keep.to_json)}

