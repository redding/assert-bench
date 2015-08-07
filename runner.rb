require 'cli'
require 'pathname'
require 'scmd'

class AssertBenchRunner

  def initialize(args, opts)
    @folder = args.first
    if @folder.to_s.empty?
      raise CLIRB::Error, "please specify a folder to bench."
    end

    @folder_path = Pathname.new(File.expand_path("../#{@folder}", __FILE__))
    if !@folder_path.exist?
      raise ArgumentError, "no #{@folder.inspect} folder"
    end
    if !@folder_path.join('config.ru').exist?
      raise ArgumentError, "no #{@folder.inspect} config.ru"
    end

    @gemfile_path = @folder_path.join('Gemfile')
    if !@gemfile_path.exist?
      raise ArgumentError, "no #{@folder.inspect} Gemfile"
    end

    @results_path = @folder_path.join('bench_results.txt')
  end

  def run
    puts "\nrunning bench scripts...\n"
    cmd(reset_cmd_str).run!
    cmd(bench_cmd_str).run!

    puts "\nresults:"
    puts cmd(results_cmd_str).run!.stdout
  end

  private

  def reset_cmd_str
    "rm -f #{@results_path}"
  end

  def bench_cmd_str
    "cd #{@folder_path} &&"\
    " BUNDLE_GEMFILE=#{@gemfile_path}"\
    " bundle exec --verbose assert"\
    " --no-pp-objects --no-capture-output --no-halt-on-fail"\
    " --no-profile --no-verbose --no-list"
  end

  def results_cmd_str
    "cat #{@results_path}"
  end

  def cmd(cmd_string)
    Scmd.new(cmd_string).tap{ |c| puts "** #{c}" }
  end

end
