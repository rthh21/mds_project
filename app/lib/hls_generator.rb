require 'hls'

class HlsGenerator
  def self.process(input_path, output_path)
    FileUtils.mkdir_p(output_path)

    HLS::Transcoder.new(
      input_path,
      output_path: output_path,
      hls_time: 6,
      segment_filename: 'segment_%03d.ts',
      playlist_name: 'playlist.m3u8'
    ).run
  end
end
