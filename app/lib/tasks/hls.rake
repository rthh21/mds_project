namespace :hls do
  desc "Process video for a room"
  task :generate, [:room_id, :file] => :environment do |t, args|
    path = Rails.root.join("public", "streams", "room_#{args[:room_id]}")
    HlsGenerator.process(args[:file], path.to_s)
    puts "HLS generated for room #{args[:room_id]}"
  end
end
