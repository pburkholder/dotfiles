

homebin = File.join(ENV['HOME'], "bin")
directory homebin

link "#{homebin}/vmrun" do
  to'Applications/VMware Fusion.app/Contents/Library/vmrun'
end